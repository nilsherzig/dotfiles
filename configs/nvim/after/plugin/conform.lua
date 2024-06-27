require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettier" },
		yaml = { "prettier" },
		-- go = { "goimports", "gofmt", "gofumpt" },
		go = { "gofumpt", "gci" },
		nix = { "nixfmt" },
		templ = { "templ" },
		svelte = { "prettier" },
		typescript = { "prettier" },
		json = { "jq" },
		-- ["*"] = { "codespell" },
	},

	format_after_save = {
		lsp_fallback = true,
	},
})
