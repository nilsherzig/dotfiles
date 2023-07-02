local lsp = require("lsp-zero")
lsp.preset("recommended")

-- uncomment this, if you're not on nixos
-- install via nixpkgs if youre using nixos
-- lsp.ensure_installed({
-- 	-- "pyright",
-- 	-- "clangd",
-- 	-- "tsserver",
-- 	-- "rust_analyzer",
-- 	-- "lua_ls",
-- 	-- "nil_ls",
-- 	-- "marksman",
--     -- "jdtls",
-- 	-- "gradle_ls",
-- 	-- "bashls",
-- 	-- "docker_compose_language_service",
-- 	-- "dockerls",
-- 	-- "ruff_lsp",
--     -- "gopls"
-- })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').gopls.setup {}         -- installed via nixpkgs
require('lspconfig').bashls.setup {}        -- installed via nixpkgs
require('lspconfig').lua_ls.setup {}        -- installed via nixpkgs
require('lspconfig').nil_ls.setup {}        -- installed via nixpkgs
require('lspconfig').rust_analyzer.setup {} -- installed via nixpkgs
require('lspconfig').marksman.setup {}      -- installed via nixpkgs
require('lspconfig').html.setup {}          -- installed via nixpkgs
-- require('lspconfig').jdtls.setup {}          -- installed via nixpkgs
require('lspconfig').tsserver.setup {}          -- installed via nixpkgs
require('lspconfig').terraformls.setup {}          -- installed via nixpkgs
require('lspconfig').svelte.setup {}          -- installed via nixpkgs
require('lspconfig').svelte.setup {}          -- installed via nixpkgs
require('lspconfig').tailwindcss.setup {}          -- installed via nixpkgs

require('lspconfig').cssls.setup {
  capabilities = capabilities,
}

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<S-tab>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<tab>"] = cmp.mapping.select_next_item(cmp_select),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I",
    },
})

-- lsp.on_attach(function(client, bufnr)
--     local opts = { buffer = bufnr, remap = false }
local opts = { remap = false }

vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
end, opts)
vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
end, opts)
vim.keymap.set("n", "<leader>vws", function()
    vim.lsp.buf.workspace_symbol()
end, opts)
vim.keymap.set("n", "<leader>lf", function()
    vim.lsp.buf.format()
end, opts)
vim.keymap.set("n", "<leader>vd", function()
    vim.diagnostic.open_float()
end, opts)
vim.keymap.set("n", "<leader>ln", function()
    vim.diagnostic.goto_next()
end, opts)
vim.keymap.set("n", "<leader>lp", function()
    vim.diagnostic.goto_prev()
end, opts)
vim.keymap.set("n", "<leader>la", function()
    vim.lsp.buf.code_action()
end, opts)
vim.keymap.set("n", "<leader>vrr", function()
    vim.lsp.buf.references()
end, opts)
vim.keymap.set("n", "<leader>lr", function()
    vim.lsp.buf.rename()
end, opts)
vim.keymap.set("i", "<C-h>", function()
    vim.lsp.buf.signature_help()
end, opts)
-- end)

lsp.setup()

cmp.setup({
    preselect = "item",
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    completion = {
        completeopt = "menu,menuone,noinsert",
    },

    window = {
        documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',

        },
        completion = {
            scrollbar = false,
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
            col_offset = -3,
            side_padding = 0,
        },
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "    (" .. (strings[2] or "") .. ")"
            return kind
        end,
    },

    sources = {
        { name = "luasnip", keyword_length = 2 },
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "orgmode" },
        { name = "buffer",  keyword_length = 3 },
    },
})

vim.diagnostic.config({
    virtual_text = true,
})
