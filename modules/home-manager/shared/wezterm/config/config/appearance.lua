local colors = require('config.colors')

return {
  max_fps = 60,
  color_scheme = colors.scheme_for_appearance(colors.get_appearance()),

  -- tab bar
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  use_fancy_tab_bar = false,
  tab_max_width = 25,
  show_tab_index_in_tab_bar = false,
  switch_to_last_active_tab_when_closing_tab = true,
  window_decorations = "RESIZE", -- AEROSPACE yes !

  -- window
  window_padding = {
    left = 0,
    right = 0,
    top = 10,
    bottom = 7.5
  },
  adjust_window_size_when_changing_font_size = false,
  window_frame = {
    active_titlebar_bg = "#090909"
  },
  visual_bell = {
    fade_in_function = 'EaseIn',
    fade_in_duration_ms = 250,
    fade_out_function = 'EaseOut',
    fade_out_duration_ms = 250, 
    target = 'CursorColor'
  }
}
