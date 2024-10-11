-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action


-- This will hold the configuration.
local config = wezterm.config_builder()

local dimmer = { brightness = 0.2 }

config.color_scheme = 'Mikazuki (terminal.sexy)'
-- config.color_scheme = 'Sonokai (Gogh)'
config.window_background_opacity = 1
config.background = {
  {
    source = {
      File ='/Users/fajarfathirwan/Downloads/rick.jpg',
      -- File ='/Users/fajarfathirwan/Downloads/roxy.jpg',
      -- File ='/Users/fajarfathirwan/Downloads/power.jpg',
    },
    -- repeat_x = 'Mirror',
    width = '109%',
    -- horizontal_offset = '10%',
    -- vertical_offset = '-50%',

    hsb = dimmer,
    -- attachment = "Fixed",
    -- attachment = { Parallax = 0.1 },
  },
}
config.keys = {
  -- activate pane selection mode with the default alphabet (labels are "a", "s", "d", "f" and so on)
  { key = 'b', mods = 'CTRL', action = act.PaneSelect },
  { key = 'v', mods = 'CTRL', action = act.TogglePaneZoomState },
  -- activate pane selection mode with numeric labels
  {
    key = '0',
    mods = 'CTRL',
    action = act.PaneSelect {
      mode = 'SwapWithActive',
    },
  },
  -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
  { key = "LeftArrow", mods = "OPT", action = wezterm.action { SendString = "\x1bb" } },
  -- Make Option-Right equivalent to Alt-f; forward-word
  { key = "RightArrow", mods = "OPT", action = wezterm.action { SendString = "\x1bf" } },
}
return config
