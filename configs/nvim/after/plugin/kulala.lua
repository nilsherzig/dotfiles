vim.filetype.add({
	extension = {
		["http"] = "http",
	},
})

require("kulala").setup({
	default_view = "body",
	display_mode = "float",
})
