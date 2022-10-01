local wezterm = require 'wezterm';

-- How to call lua function
function query_appearance_gnome()
  local success, stdout = wezterm.run_child_process {
    'gsettings',
    'get',
    'org.gnome.desktop.interface',
    'gtk-theme',
  }
  -- lowercase and remove whitespace
  stdout = stdout:lower():gsub('%s+', '')
  local mapping = {
    highcontrast = 'LightHighContrast',
    highcontrastinverse = 'DarkHighContrast',
    adwaita = 'Light',
    ['adwaita-dark'] = 'Dark',
  }
  local appearance = mapping[stdout]
  if appearance then
    return appearance
  end
  if stdout:find 'dark' then
    return 'nord'
  end
  return 'Novel'
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local pane_title = tab.active_pane.title
  local user_title = tab.active_pane.user_vars.panetitle

  if user_title ~= nil and #user_title > 0 then
    pane_title = user_title
  end

  return {
    -- {Background={Color="blue"}},
    -- {Foreground={Color="white"}},
    {Text=" " .. pane_title .. " "},
  }
end)

return {
    color_scheme = "nord",
    font = wezterm.font_with_fallback({"JetBrains Mono NL", "Fira Code"}),
    line_height = 1.4,
    hide_tab_bar_if_only_one_tab = true,
    window_background_opacity = 0.99,
    warn_about_missing_glyphs = false,
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = true,
    tab_max_width = 20,
    window_decorations = "NONE",
    font_antialias = "Subpixel",
    window_padding = {
        -- left = 2,
        -- right = 2,
        -- top = 0,
        -- bottom = 10,
    },
}
