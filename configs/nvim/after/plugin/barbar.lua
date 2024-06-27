vim.g.barbar_auto_setup = false -- disable auto-setup

local barbar = require("barbar")
barbar.setup({
	-- WARN: do not copy everything below into your config!
	--       It is just an example of what configuration options there are.
	--       The defaults are suitable for most people.

	-- Enable/disable animations
	animation = false,

	clickable = false,

	-- Enable highlighting visible buffers
	highlight_visible = true,
	-- auto_hide = 1,

	icons = {
		-- Configure the base icons on the bufferline.
		-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
		buffer_index = false,
		buffer_number = false,
		button = "",
		-- Enables / disables diagnostic symbols
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = false },
			[vim.diagnostic.severity.WARN] = { enabled = false },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = false },
		},
		-- gitsigns = {
		-- 	added = { enabled = true, icon = "+" },
		-- 	changed = { enabled = true, icon = "~" },
		-- 	deleted = { enabled = true, icon = "-" },
		-- },
		filetype = {
			-- Requires `nvim-web-devicons` if `true`
			enabled = false,
		},
		separator = { left = "▎" },
		-- separator = { left = "", right = "" },

		-- Configure the icons on the bufferline when modified or pinned.
		-- Supports all the base icon options.
		modified = { button = "" },

		-- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
		preset = "default",

		-- Configure the icons on the bufferline based on the visibility of a buffer.
		-- Supports all the base icon options, plus `modified` and `pinned`.
		alternate = { filetype = { enabled = false } },
		current = { buffer_index = false },
		inactive = { button = "" },
		visible = { modified = { buffer_number = false } },
	},
})
