local bufferline = require("bufferline")
bufferline.setup({
	options = {
		mode = "buffers", -- set to "tabs" to only show tabpages instead
		style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
		themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
		-- indicator = {
		-- 	-- icon = "-", -- this should be omitted if indicator style is not 'icon'
		-- 	style = "underline",
		-- },
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        separator_style = "thin",
        sort_by = "relative_directory"
	},
})
