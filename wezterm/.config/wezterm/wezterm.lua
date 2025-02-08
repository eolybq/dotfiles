local wezterm = require("wezterm")
local config = {}

config.default_prog = { "/usr/bin/fish" }

config.font = wezterm.font("JetBrainsMono NFM", { weight = "DemiBold" })
config.font_size = 18

-- config.color_scheme = 'carbonfox'
config.color_scheme = 'terafox'

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false


-- Tabs use whole tab bar
config.tab_max_width = 999
local function get_max_cols(window)
  local tab = window:active_tab()
  local cols = tab:get_size().cols
  return cols
end

wezterm.on(
  'window-config-reloaded',
  function(window)
    wezterm.GLOBAL.cols = get_max_cols(window)
  end
)

wezterm.on(
  'window-resized',
  function(window, pane)
    wezterm.GLOBAL.cols = get_max_cols(window)
  end
)

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab.active_pane.title
    local full_title = '[' .. tab.tab_index + 1 .. '] ' .. title
    local pad_length = (wezterm.GLOBAL.cols // #tabs - #full_title) // 2
    if pad_length * 2 + #full_title > max_width then
      pad_length = (max_width - #full_title) // 2
    end
    return string.rep(' ', pad_length) .. full_title .. string.rep(' ', pad_length)
  end
)





-- config.window_frame = {
--   active_titlebar_bg = '#000000',
-- }

config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 800
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"

config.keys = {
  { key = 'Space', mods = 'CTRL', action = wezterm.action.ShowLauncher },
}

local dimmer = { brightness = 0.1 }
config.background = {
  {
    source = {
      Color = "black", -- Nastaví pevné černé pozadí
    },
    height = "100%",
    width = "100%",
  },
  {
    source = {
      File = "/home/vasek/wallpapers/artworks-uGWnvlsCgIYzOJen-nDoj2w-t500x500.jpg",
    },
    horizontal_align = "Center",
    vertical_align = "Middle", -- Zarovnání k dolnímu okraji
    width = "Contain",       -- Zachová původní šířku obrázku
    height = "Contain",      -- Zachová původní výšku
    repeat_y = "NoRepeat",   -- Zabrání opakování obrázku vodorovně
    repeat_x = "NoRepeat",   -- Zabrání opakování obrázku svisle
    hsb = dimmer,
    opacity = 0.7
  },
}

config.window_padding ={
  left = 3,
  right = 3,
  top = 0,
  bottom = 0,
}

return config
