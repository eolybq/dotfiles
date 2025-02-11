local wezterm = require("wezterm")
local config = {}

config.default_prog = {
  "/usr/bin/fish",
  -- "-c",
  -- [[
  --   if type -q tmux
  --       tmux attach || tmux new
  --   else
  --       exec fish
  --   end
  -- ]],
}


config.font = wezterm.font("JetBrainsMono NFM", { weight = "DemiBold" })
config.font_size = 19

-- config.color_scheme = 'carbonfox'
config.color_scheme = 'terafox'

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(
  config,
  {
    modules = {
      clock = {
        enabled = false,
      },
      hostname = {
        enabled = false,
      },
      pane = {
        enabled = false,
      },
      workspace = {
        enabled = false,
      },
    },
  }
)


config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
-- config.use_fancy_tab_bar = false


config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 800
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.keys = {
  { key = 'b', mods = 'CTRL', action = wezterm.action.ShowLauncher },
}


local dimmer = { brightness = 0.05 }
config.background = {
    {
      source = {
        -- Color = "#152528",
        Color = "black",
      },
      height = "100%",
      width = "100%",
    },
    {
        source = {
            File = "/home/vasek/wallpapers/mirror.jpg",
        },
        horizontal_align = "Center",
        vertical_align = "Middle", -- Zarovnání k dolnímu okraji
        width = "Contain",   -- Zachová původní šířku obrázku
        height = "Contain",  -- Zachová původní výšku
        repeat_y = "NoRepeat", -- Zabrání opakování obrázku vodorovně
        repeat_x = "NoRepeat", -- Zabrání opakování obrázku svisle
        hsb = dimmer,
        opacity = 1,
    },
}


config.window_padding ={
  left = 3,
  right = 3,
  top = 0,
  bottom = 0,
}

return config
