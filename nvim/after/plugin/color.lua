require("tokyonight").setup({
    terminal_colors = true,
})

local colors = require("tokyonight.colors").setup() -- pass in any of the config options as explained above

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
	    fg = colors.orange
    })

    hl("LineNr", {
        fg = colors.orange
    })

    hl("Comment", {
        fg = colors.orange -- "#f8660d"
    })

    hl("FloatBorder", {
        fg = colors.red
    })
end

vim.cmd[[colorscheme tokyonight-night]]
SetMyColors()

