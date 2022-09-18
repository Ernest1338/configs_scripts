-- file location: ~/.config/wezterm/wezterm.lua

local wt = require('wezterm')

return {
    enable_scroll_bar = true,
    use_fancy_tab_bar = false,
    --window_decorations = 'TITLE',
    window_decorations = 'NONE',
    hide_tab_bar_if_only_one_tab = true,
    font = wt.font 'Hack',
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    default_cursor_style = 'BlinkingBar',
    color_scheme = 'Gruber (base16)',
    --color_scheme = 'Helios (base16)',
    --window_background_image = '/home/dvdmanjaro/Downloads/term_bg.jpg',
    --window_background_image_hsb = {
    --    brightness = 0.02,
    --},
    window_background_opacity = 0.95,
    tab_bar_at_bottom = true,
    scrollback_lines = 2000,
    keys = {
        { key = 'LeftArrow', mods = 'SHIFT', action = wt.action.ActivateTabRelative(-1) },
        { key = 'RightArrow', mods = 'SHIFT', action = wt.action.ActivateTabRelative(1) },
        { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = wt.action.MoveTabRelative(-1) },
        { key = 'RightArrow', mods = 'SHIFT|CTRL', action = wt.action.MoveTabRelative(1) },
    },
    -- improves performance?
    cursor_blink_ease_in = "Constant",
    cursor_blink_ease_out = "Constant",
    animation_fps = 1,
    cursor_blink_rate = 500,
}
