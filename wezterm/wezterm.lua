local wezterm = require("wezterm")
return {
	font_size = 18,
	font = wezterm.font("Red Hat Mono", { weight = "Medium" }),
	-- font = wezterm.font("Source Code Pro", { weight = "Medium" }),
	-- font = wezterm.font('Fira Code', { weight = 'Medium' }),
	color_scheme = "Horizon Dark (base16)",
	-- Paste on right click
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Right" } },
			mods = "NONE",
			action = wezterm.action.Paste,
		},
	},
	-- reclaim ctrl-q to use as tmux leader
	keys = {
		{ mods = "CTRL", key = "q", action = wezterm.action({ SendString = "\x11" }) },
	},
}
