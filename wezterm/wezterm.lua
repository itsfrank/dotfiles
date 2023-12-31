local wezterm = require("wezterm")

return {
	-- fonts
	font_size = 18,
	font = wezterm.font("Red Hat Mono", { weight = "Medium" }),
	-- font = wezterm.font("Source Code Pro", { weight = "Medium" }),
	-- font = wezterm.font('Fira Code', { weight = 'Medium' }),

	-- colors
	-- color_scheme = "Horizon Dark (base16)",
	color_scheme = "rose-pine",

	-- clean look
	window_decorations = "RESIZE",
	hide_tab_bar_if_only_one_tab = true,
	-- Paste on right click
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Right" } },
			mods = "NONE",
			action = wezterm.action.PasteFrom("Clipboard"),
		},
	},
}
