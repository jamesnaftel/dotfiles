
local actions = require('telescope.actions')
local sorters = require('telescope.sorters')
local themes = require('telescope.themes')

require('telescope').setup {
    defaults = {
        --file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >> ',
        winblend = 0,
				preview_cutoff = 120,
    		layout_strategy = 'horizontal',
    		layout_defaults = {
    		  horizontal = {
    		    width_padding = 0.1,
    		    height_padding = 0.1,
    		    preview_width = 0.6,
    		  },
    		  vertical = {
    		    width_padding = 0.05,
    		    height_padding = 1,
    		    preview_height = 0.5,
    		  }
    		},

    		selection_strategy = "reset",
    		sorting_strategy = "descending",
    		scroll_strategy = "cycle",
    		prompt_position = "top",
				color_devicons = true,

--        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
--        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
--        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
--
--        mappings = {
--            i = {
--                ["<C-x>"] = false,
--                ["<C-q>"] = actions.send_to_qflist,
--            },
--        }
    }
--    extensions = {
--        fzy_native = {
--            override_generic_sorter = false,
--            override_file_sorter = true,
--        }
--    }
}

--require('telescope').load_extension('fzy_native')

local M = {}
function M.search_dotfiles()
    require('telescope.builtin').find_files{
        prompt_title = "~~ envfiles ~~",
        cwd = "$HOME/.config/nvim/",
    }
end

function M.edit_zsh()
  require('telescope.builtin').find_files {
    shorten_path = false,
    cwd = "~/.config/zsh/",
    prompt = "~ dotfiles ~",
    hidden = true,

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.55,
    },
  }
end
