local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config = {
    enable_wayland = false,
    color_scheme = 'Kanagawa (Gogh)',
    font_size = 20,
    font = wezterm.font 'Iosevka',
    window_decorations = "NONE",
    -- integrated_title_button_style = "Gnome",
    hide_tab_bar_if_only_one_tab = true,
    enable_scroll_bar = true,

    window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10,
    },
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
}

return config
