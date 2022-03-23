local wezterm = require 'wezterm';

return {
    color_scheme = "nord",
    font = wezterm.font_with_fallback({"JetBrains Mono NL", "Fira Code"}),
    line_height = 1.4,
    hide_tab_bar_if_only_one_tab = true,
    window_background_opacity = 1.0
}
