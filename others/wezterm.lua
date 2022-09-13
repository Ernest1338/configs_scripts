-- file location: ~/.config/wezterm/wezterm.lua
return {
    enable_scroll_bar = true,
    use_fancy_tab_bar = false,
    --window_decorations = 'TITLE',
    window_decorations = 'NONE',
    hide_tab_bar_if_only_one_tab = true,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    default_cursor_style = 'BlinkingBar',
    color_scheme = 'Gruber (base16)',
    window_background_opacity = 0.95,
    tab_bar_at_bottom = true,
    scrollback_lines = 2000,
    keys = {
        { key = 'LeftArrow', mods = 'SHIFT', action = require('wezterm').action.ActivateTabRelative(-1) },
        { key = 'RightArrow', mods = 'SHIFT', action = require('wezterm').action.ActivateTabRelative(1) },
    },
    -- improves performance?
    cursor_blink_ease_in = "Constant",
    cursor_blink_ease_out = "Constant",
    animation_fps = 1,
    cursor_blink_rate = 500,
}
