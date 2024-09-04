-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 19

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.color_scheme = 'CustomMoonfly'
config.colors = {
    foreground = "#bdbdbd",
    background = "black",
    cursor_bg = "#9e9e9e",
    cursor_fg = "#080808",
    cursor_border = "#9e9e9e",
    selection_bg = "#b2ceee",
    selection_fg = "#080808",
    scrollbar_thumb = "#9e9e9e",
    split = "#9e9e9e",

    ansi = {
      "#323437",
      "#ff5454",
      "#8cc85f",
      "#e3c78a",
      "#80a0ff",
      "#cf87e8",
      "#79dac8",
      "#c6c6c6",
    },

    brights = {
      "#949494",
      "#ff5189",
      "#36c692",
      "#c2c292",
      "#74b2ff",
      "#ae81ff",
      "#85dc85",
      "#e4e4e4",
    },

    compose_cursor = "#e3c78a",
    visual_bell = "#e3c78a",
}

return config
