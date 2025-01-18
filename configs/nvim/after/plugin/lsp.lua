local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")

vim.opt.signcolumn = 'yes'

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "pyright",
        "clangd",
        "rust_analyzer",
        "marksman",
        "gradle_ls",
        "bashls",
        "docker_compose_language_service",
        "dockerls",
        "gopls"
    }
})


lspconfig.ruff.setup({})
lspconfig.eslint.setup({})
lspconfig.gleam.setup({})
lspconfig.bashls.setup({})
lspconfig.hls.setup({})
lspconfig.ltex.setup({
    filetypes = { "markdown" },
})
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    "vim",
                    "require",
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})
lspconfig.nil_ls.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.marksman.setup({})
lspconfig.unison.setup({})
lspconfig.html.setup({
    filetypes = { "html", "templ" },
})
lspconfig.ts_ls.setup({})
lspconfig.terraformls.setup({})
lspconfig.svelte.setup({
    -- filetypes = { "svelte", "javascript", "typescript" },
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.js", "*.ts" },
            callback = function(ctx)
                -- Here use ctx.match instead of ctx.file
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
            end,
        })
    end,
})
lspconfig.tinymist.setup({
    settings = {
        exportPdf = "onType",
        outputPath = "$root/target/$dir/$name",
    },
})

lspconfig.texlab.setup({})
lspconfig.tailwindcss.setup({
    filetypes = { "templ", "html", "css", "javascript", "typescript", "svelte" },
    init_options = {
        userLanguages = {
            svelte = "html",
            templ = "html",
        },
    },
})

if not configs.golangcilsp then
    configs.golangcilsp = {
        default_config = {
            cmd = { "golangci-lint-langserver" },
            root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
            init_options = {
                command = {
                    "golangci-lint",
                    "run",
                    "--out-format",
                    "json",
                    "--issues-exit-code=1",
                },
            },
        },
    }
end

lspconfig.golangci_lint_ls.setup({
    filetypes = { "go", "gomod" },
})

lspconfig.gopls.setup({})

local cfg = require("yaml-companion").setup({})
lspconfig.yamlls.setup(cfg)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").cssls.setup({
    capabilities = capabilities,
})

-- lsp.set_preferences({
-- 	suggest_lsp_servers = true,
-- 	sign_icons = {
-- 		error = "●",
-- 		warn = "●",
-- 		hint = "●",
-- 		info = "●",
-- 	},
-- })
local opts = { remap = false }

vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
end, opts)
vim.keymap.set("n", "<leader>k", function()
    vim.lsp.buf.hover()
end, opts)
vim.keymap.set("n", "<leader>a", function()
    vim.lsp.buf.code_action()
end, opts)
vim.keymap.set("n", "<leader>r", function()
    vim.lsp.buf.rename()
end, opts)

lsp.setup()

-- vim.diagnostic.config({
-- 	virtual_text = true,
-- })

local lspkind = require("lspkind")
local cmp = require("cmp")
cmp.setup({
    -- performance = {
    --     max_view_entries = 10,
    -- },
    window = {
        completion = {
            border = nil,
        },
        documentation = {
            border = nil,
        },
    },
    experimental = {
        ghost_text = false,
    },
    formatting = {
        fields = { "kind", "abbr" },
        format = function(entry, vim_item)
            local kind = lspkind.cmp_format({
                mode = "symbol_text",
                maxwidth = 50,
                symbol_map = { Copilot = "" },
            })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.abbr = vim_item.abbr
            return kind
        end,
    },
    sources = {
        { name = "copilot", group_index = 2 },
        { name = "path" },
        { name = "nvim_lsp" },
    },
    completion = {
        completeopt = "menu,menuone,noinsert", -- Always select the first item
    },
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Changed to select=true
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
})
