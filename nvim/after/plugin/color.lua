-- vim.g.tokyonight_style = "night"
-- vim.cmd("colorscheme tokyonight")
-- vim.g.tokyonight_colors = { comment = "#f8660d", border = "yellow" }
--
vim.cmd[[colorscheme tokyonight]]

require("tokyonight").setup({
  -- use the night style
  style = "night",
  -- disable italic for functions
  styles = {
    functions = "NONE"
  },
})

function SetMyColors()
    local hl = function(thing, opts)
        vim.api.nvim_set_hl(0, thing, opts)
    end

    hl("SignColumn", {
        bg = "none",
    })

   hl("ColorColumn", {
       ctermbg = 0,
       bg = "#555555",
   })

    hl("CursorLineNR", {
        bg = "None",
	fg = "#f8660d"
    })

    hl("LineNr", {
        fg = "#f8660d"
    })
end

SetMyColors()

