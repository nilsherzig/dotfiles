local highlight = {
	"CursorColumn",
	"Whitespace",
}
require("ibl").setup({
	-- indent = { highlight = highlight, char = "" },
	whitespace = {
		highlight = highlight,
		remove_blankline_trail = false,
	},
	scope = { enabled = false },
	debounce = 100,
	indent = { char = "│" },
	-- whitespace = { highlight = { "Whitespace", "NonText" } },
})
