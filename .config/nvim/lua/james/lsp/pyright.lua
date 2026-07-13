local function set_python_path(path)
  local clients = vim.lsp.get_clients {
    bufnr = vim.api.nvim_get_current_buf(),
    name = 'pyright',
  }
  for _, client in ipairs(clients) do
    if client.settings then
      client.settings.python = vim.tbl_deep_extend('force', client.settings.python, { pythonPath = path })
    else
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, { python = { pythonPath = path } })
    end
    client.notify('workspace/didChangeConfiguration', { settings = nil })
  end
end

-- Walk up from `start_dir` to find the directory that contains `.git`
-- (either a directory for a normal repo, or a file for a worktree).
local function find_git_root(start_dir)
  local dir = start_dir
  while dir and dir ~= '' and dir ~= '/' do
    if vim.uv.fs_stat(dir .. '/.git') then
      return dir
    end
    local parent = vim.fn.fnamemodify(dir, ':h')
    if parent == dir then break end
    dir = parent
  end
  return start_dir
end

-- For a git worktree, follow the gitdir pointer back to the main repo root.
-- A worktree's .git is a file: "gitdir: /path/to/main/.git/worktrees/<name>"
local function resolve_main_repo_root(git_root)
  local git_path = git_root .. '/.git'
  local stat = vim.uv.fs_stat(git_path)
  if stat and stat.type == 'file' then
    local f = io.open(git_path, 'r')
    if not f then return git_root end
    local line = f:read('*l')
    f:close()
    local gitdir = line and line:match('^gitdir:%s*(.+)$')
    if gitdir then
      local main_root = gitdir:match('^(.+)/%.git/worktrees/[^/]+$')
      if main_root then return main_root end
    end
  end
  return git_root
end

-- Write a pyrightconfig.json into the worktree root so pyright picks up
-- the branch's own source root rather than the venv's stale main-checkout copy.
-- Inherits extraPaths/pythonVersion from the main repo's pyrightconfig.json
-- so this works for any project, not just falcon.
-- The file is gitignored so it won't pollute the branch.
local function write_worktree_pyrightconfig(worktree_root, main_root, venv_python)
  -- Seed from the main repo's pyrightconfig.json if present
  local cfg = { typeCheckingMode = 'basic' }
  local src_cfg_path = main_root .. '/pyrightconfig.json'
  local src = io.open(src_cfg_path, 'r')
  if src then
    local ok, parsed = pcall(vim.json.decode, src:read('*a'))
    src:close()
    if ok and parsed then
      cfg = parsed
    end
  end

  -- Only hardcode pythonPath when the venv actually exists at this path
  -- (i.e. we're on the machine that owns it). On EC2 the venv lives at a
  -- different absolute path, so omit it and let pyright find the venv itself.
  if vim.uv.fs_stat(venv_python) then
    cfg.pythonPath = venv_python
  else
    cfg.pythonPath = nil
  end

  local f = io.open(worktree_root .. '/pyrightconfig.json', 'w')
  if f then
    f:write(vim.json.encode(cfg))
    f:close()
  end
end

vim.lsp.config('pyright', {
  name = 'pyright',
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    '.git',
    'pyrightconfig.json',
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'Pipfile',
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
        diagnosticSeverityOverrides = {
          reportMissingImports = 'none',
        },
      },
    },
  },
  before_init = function(params, config)
    local start_dir = config.root_dir
      or (params.rootUri and params.rootUri:gsub('^file://', ''))
    if not start_dir then
      return
    end

    local git_root     = find_git_root(start_dir)
    local main_root    = resolve_main_repo_root(git_root)
    local worktree_root = git_root

    -- Fix root so pyright sees the whole repo, not a nested subdir
    config.root_dir       = worktree_root
    params.rootUri        = 'file://' .. worktree_root
    params.workspaceFolders = { { uri = 'file://' .. worktree_root, name = worktree_root } }

    -- Only act when this is a worktree (main_root differs from worktree_root)
    if worktree_root == main_root then
      return
    end

    local venv_python = main_root .. '/.venv/bin/python'
    if not vim.uv.fs_stat(venv_python) then
      return
    end

    -- Write a pyrightconfig.json at the worktree root pointing at
    -- the worktree's own edison/ — this beats the venv sys.path which
    -- always resolves to main's edison/ copy.
    write_worktree_pyrightconfig(worktree_root, main_root, venv_python)
  end,
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightOrganizeImports', function()
      client:exec_cmd({
        command = 'pyright.organizeimports',
        arguments = { vim.uri_from_bufnr(bufnr) },
      })
    end, {
      desc = 'Organize Imports',
    })
    vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightSetPythonPath', set_python_path, {
      desc = 'Reconfigure pyright with the provided python path',
      nargs = 1,
      complete = 'file',
    })
  end,
})
