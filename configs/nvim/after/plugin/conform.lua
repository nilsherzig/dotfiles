require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        go = { "gofmt" },
        nix = { "nixfmt" }
    },

    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
})
