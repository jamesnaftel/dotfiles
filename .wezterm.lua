-- Pull in the wezterm API
local wezterm                 = require("wezterm")
local config                  = wezterm.config_builder()
local target_os               = wezterm.target_triple

-- List nerd fonts -> fc-list | grep -i "JetBrains" | awk -F',|: ' '{print $2}'
config.font                   = wezterm.font_with_fallback {
  "JetBrainsMono Nerd Font Mono",
}

config.font_size              = 16

config.freetype_load_target   = "HorizontalLcd"
config.freetype_render_target = "HorizontalLcd"

config.enable_tab_bar         = false

config.window_decorations     = "RESIZE"

--config.color_scheme           = 'Kanagawa (Gogh)'
config.color_scheme           = 'Kasugano (terminal.sexy)'
config.colors                 = {
  background = "#000",
  cursor_bg = "#9B96B5",
  cursor_fg = "#1a1a1e",
  cursor_border = "#9B96B5",
}

if target_os:find("linux") then
  config.keys = {
    -- Switch to specific tabs by index (1-9)
    { key = "1", mods = "CTRL", action = wezterm.action { ActivateTab = 0 } },
    { key = "2", mods = "CTRL", action = wezterm.action { ActivateTab = 1 } },
    { key = "3", mods = "CTRL", action = wezterm.action { ActivateTab = 2 } },
    { key = "4", mods = "CTRL", action = wezterm.action { ActivateTab = 3 } },
    { key = "5", mods = "CTRL", action = wezterm.action { ActivateTab = 4 } },
    { key = "6", mods = "CTRL", action = wezterm.action { ActivateTab = 5 } },
    { key = "7", mods = "CTRL", action = wezterm.action { ActivateTab = 6 } },
    { key = "8", mods = "CTRL", action = wezterm.action { ActivateTab = 7 } },
    { key = "9", mods = "CTRL", action = wezterm.action { ActivateTab = 8 } },
  }
end

return config
