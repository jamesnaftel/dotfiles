
local actions = require('telescope.actions')
local sorters = require('telescope.sorters')
local themes = require('telescope.themes')

require('telescope').setup {
  defaults = {
    --file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' >> ',
    winblend = 0,
  	layout_strategy = 'horizontal',
  	layout_config = {
  	  horizontal = {
  	    width_padding = 0.1,
  	    height_padding = 0.1,
  	    preview_width = 0.6,
  	  },
  	  vertical = {
  	    width_padding = 0.05,
  	    height_padding = 1,
  	    preview_height = 0.5,
  	  },
			prompt_position = "top",
			preview_cutoff = 120,
  	},
  	selection_strategy = "reset",
  	sorting_strategy = "descending",
  	scroll_strategy = "cycle",
		color_devicons = true,
  },
  extensions = {
    fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",
    }
  }
}
require('telescope').load_extension('fzf')

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
