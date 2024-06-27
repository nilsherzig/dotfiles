local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

if wezterm.config_builder then
	config = wezterm.config_builder()
end
-- local mux = wezterm.mux
--
-- local cache_dir = os.getenv("HOME") .. "/.cache/wezterm/"
-- local window_size_cache_path = cache_dir .. "window_size_cache.txt"
-- wezterm.on("gui-startup", function()
-- 	os.execute("mkdir " .. cache_dir)
--
-- 	local window_size_cache_file = io.open(window_size_cache_path, "r")
-- 	if window_size_cache_file ~= nil then
-- 		_, _, width, height = string.find(window_size_cache_file:read(), "(%d+),(%d+)")
-- 		mux.spawn_window({ width = tonumber(width), height = tonumber(height) })
-- 		window_size_cache_file:close()
-- 	else
-- 		local tab, pane, window = mux.spawn_window({})
-- 		window:gui_window():maximize()
-- 	end
-- end)
--
-- wezterm.on("window-resized", function(window, pane)
-- 	local window_size_cache_file = io.open(window_size_cache_path, "r")
-- 	if window_size_cache_file == nil then
-- 		local tab_size = pane:tab():get_size()
-- 		cols = tab_size["cols"]
-- 		rows = tab_size["rows"] + 2 -- Without adding the 2 here, the window doesn't maximize
-- 		contents = string.format("%d,%d", cols, rows)
-- 		window_size_cache_file = assert(io.open(window_size_cache_path, "w"))
-- 		window_size_cache_file:write(contents)
-- 		window_size_cache_file:close()
-- 	end
-- end)

config = {
	skip_close_confirmation_for_processes_named = {
		"unified-search", -- used as a launcher
	},
	colors = {
		ansi = {
			"#1e1e1e",
			"#f44747",
			"#608b4e",
			"#dcdcaa",
			"#569cd6",
			"#c678dd",
			"#56b6c2",
			"#d4d4d4",
		},

		brights = {
			"#808080",
			"#f44747",
			"#608b4e",
			"#dcdcaa",
			"#569cd6",
			"#c678dd",
			"#56b6c2",
			"#d4d4d4",
		},
		cursor_bg = "#d4d4d4",
		cursor_border = "#d4d4d4",
		cursor_fg = "#1e1e1e",
		foreground = "#d4d4d4",
		selection_bg = "#dcdcaa",
		selection_fg = "#1e1e1e",
		background = "#1e1e1e",
	},
	enable_wayland = true,
	-- color_scheme = "Kanagawa (Gogh)",
	-- color_scheme = "Gruvbox Material (Gogh)",
	-- color_scheme = "GruvboxDarkHard",
	font_size = 18,
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",
	-- font = wezterm.font 'Iosevka',
	-- font = wezterm.font_with_fallback({
	-- 	-- "Iosevka",
	-- 	{ family = "Iosevka", weight = "Regular" },
	-- 	-- { family = "JetBrains Mono", weight = "Regular" },
	-- 	-- { family = "Symbols Nerd Font Mono", scale = 1 },
	-- }),
	integrated_title_button_style = "Gnome",
	-- hide_tab_bar_if_only_one_tab = true,
	-- enable_scroll_bar = true,

	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},

	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,

	keys = {
		{ key = "p", mods = "CTRL", action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|COMMANDS|WORKSPACES" }) },
		{
			key = "W",
			mods = "CTRL|SHIFT",
			action = act.PromptInputLine({
				description = wezterm.format({
					{ Attribute = { Intensity = "Bold" } },
					{ Foreground = { AnsiColor = "Fuchsia" } },
					{ Text = "Enter name for new workspace" },
				}),
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:perform_action(
							act.SwitchToWorkspace({
								name = line,
							}),
							pane
						)
					end
				end),
			}),
		},
	},
}

return config
