-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_domain = "WSL:Ubuntu-22.04"
-- config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.audible_bell = "Disabled"

config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
		end),
	},
	{
		event = { Down = { streak = 1, button = "Middle" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			end
		end),
	},
}

config.keys = {
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
}

config.background = {
	{
		source = {
			File = "C:/Users/Markus/Pictures/background.jpg",
		},
		hsb = { brightness = 0.05 },
		horizontal_align = "Center",
	},
}

return config

