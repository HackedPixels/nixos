local wezterm = require('wezterm')

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find('Dark') then
    return 'Catppuccin Mocha';
  else
    return 'Papercolor Light (Gogh)';
  end
end

return {
  scheme_for_appearance = scheme_for_appearance,
  get_appearance = get_appearance
}
