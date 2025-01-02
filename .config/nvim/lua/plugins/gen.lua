-- Custom Parameters (with defaults)
return {
  "David-Kunz/gen.nvim",
  enabled = true,
  opts = {
    model = "qwen2.5-coder:7b-instruct",
    quit_map = "q",         -- set keymap for close the response window
    retry_map = "<c-r>",    -- set keymap to re-send the current prompt
    accept_map = "<c-cr>",  -- set keymap to replace the previous selection with the last result
    host = "localhost",     -- The host running the Ollama service.
    port = "11434",         -- The port on which the Ollama service is listening.
    display_mode = "split", -- The display mode. Can be "float" or "split" or "horizontal-split".
    show_prompt = false,    -- Shows the prompt submitted to Ollama.
    show_model = true,      -- Displays which model you are using at the beginning of your chat session.
    no_auto_close = false,  -- Never closes the window automatically.
    hidden = false,         -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
    init = function(options)
      pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
    end,
    -- Function to initialize Ollama
    command = function(options)
      local body = { model = options.model, stream = true }
      return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
    end,
    debug = false, -- Prints errors and the command which is run.
  },

  config = function(_, opts)
    local gen = require('gen')
    gen.setup(opts)
    -- Experimenting
    gen.prompts['Fix_Code'] = {
      prompt =
      "Fix the following code. Only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
      replace = true,
      extract = "```$filetype\n(.-)```"
    }
  end,
  vim.keymap.set({ 'n', 'v' }, '<leader>ga', ':Gen Ask<CR>'),
  vim.keymap.set({ 'n', 'v' }, '<leader>gm', ':lua require("gen").select_model()<CR>'),
  vim.keymap.set({ 'n', 'v' }, '<leader>gg', ':Gen Enhance_Code<CR>'),
  vim.keymap.set('i', '<c-i>', '<esc>:Gen Enhance_Code<CR>'),
}
