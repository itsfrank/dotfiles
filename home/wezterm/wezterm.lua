local wezterm = require("wezterm")

return {
    -- fonts
    font_size = 18,
    font = wezterm.font("SauceCodePro Nerd Font", { weight = "Medium" }),
    -- font = wezterm.font("Source Code Pro", { weight = "Medium" }),
    -- font = wezterm.font('Fira Code', { weight = 'Medium' }),

    -- colors
    -- color_scheme = "Horizon Dark (base16)",
    color_scheme = "rose-pine",

    -- clean look
    window_decorations = "RESIZE",
    hide_tab_bar_if_only_one_tab = true,
    -- don't change window when changing font size
    adjust_window_size_when_changing_font_size = false,
    -- Paste on right click
    mouse_bindings = {
        {
            event = { Up = { streak = 1, button = "Right" } },
            mods = "NONE",
            action = wezterm.action.PasteFrom("Clipboard"),
        },
    },
    keys = {
        { -- disable alt-enter, I use for copilot/supermaven
            key = "Enter",
            mods = "ALT",
            action = wezterm.action.DisableDefaultAssignment,
        },
        { -- disable cmd-w so i dont accidentally kill wezterm
            key = "w",
            mods = "CMD",
            action = wezterm.action.DisableDefaultAssignment,
        },
    },
}
