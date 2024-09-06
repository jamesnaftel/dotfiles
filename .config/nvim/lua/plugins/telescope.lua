-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup{
        defaults = {
            color_devicons = true,
            prompt_prefix = ' >> ',
            layout_config = {
                horizontal = {
                    preview_cutoff = 0,
                },
            },
            border = true,
            borderchars = {
                prompt = { "▀", "▐", "▄", "▍", "▛", "▜", "▟", "▙" },
                results = { "▀", "▐", "▄", "▍", "▛", "▜", "▟", "▙" },
                preview = { "▀", "▐", "▄", "▍", "▛", "▜", "▟", "▙" },
            },
            -- borderchars = {
            --     prompt = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
            --     results = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
            --     preview = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
            -- },
        },
        extensions = {
            ['ui-select'] = {
                require('telescope.themes').get_dropdown(),
            },
        },
        pickers = {
            colorscheme = {
                enable_preview = true,
            },
        },
 		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>cs', builtin.colorscheme, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ts', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set("n", "<leader>tp", function()
        builtin.live_grep {
          type_filter = 'py'
        }
      end, {desc = ""})

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
}
