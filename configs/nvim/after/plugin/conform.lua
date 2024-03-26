require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettier" },
		yaml = { "prettier" },
		go = { "gofmt" },
		nix = { "nixfmt" },
		templ = { "templ" },
		svelte = { "svelte" },
	},

	format_after_save = {
		lsp_fallback = true,
	},
})
