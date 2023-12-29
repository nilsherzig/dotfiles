local lsp = require("lsp-zero")
lsp.preset("recommended")

-- lsp.ensure_installed({
-- 	"pyright",
-- 	"clangd",
-- 	"tsserver",
-- 	"rust_analyzer",
-- 	"lua_ls",
-- 	"nil_ls",
-- 	"marksman",
--     "jdtls",
-- 	"gradle_ls",
-- 	"bashls",
-- 	"docker_compose_language_service",
-- 	"dockerls",
-- 	"ruff_lsp",
--     "gopls"
-- })

-- default settings lsp server
--
local lspconfig = require("lspconfig")
lspconfig.pyright.setup({})
lspconfig.gopls.setup({})
lspconfig.bashls.setup({})
-- lspconfig.lua_ls.setup {}
require("lspconfig").lua_ls.setup({
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						},
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			})

			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end,
})
lspconfig.nil_ls.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.marksman.setup({})
lspconfig.html.setup({
	filetypes = { "html", "templ", "svelte" },
})
lspconfig.tsserver.setup({})
lspconfig.terraformls.setup({})
lspconfig.svelte.setup({})
lspconfig.typst_lsp.setup({})
lspconfig.texlab.setup({})
lspconfig.tailwindcss.setup({
	filetypes = { "html", "css", "javascript", "typescript", "svelte" },
	init_options = {
		userLanguages = {
			svelte = "html",
			template = "html",
		},
	},
})
lspconfig.templ.setup({})
-- lspconfig.htmx.setup {
--     filetypes = { "html", "templ", "svelte" },
-- }

require("lspconfig").yamlls.setup({
	format = { enabled = false },
	validate = true,
	completion = true,
	hover = true,
	settings = {
		yaml = {
			schemas = {
				kubernetes = "*.yaml",
				["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
				["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
				["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "azure-pipelines.yml",
				["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
				["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
				["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
				["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
				["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
				["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
				["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
				["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
				["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
			},
		},
	},
})
--

-- css things?
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").cssls.setup({
	capabilities = capabilities,
})

-- lsp.nvim_workspace()

-- local cmp = require("cmp")
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--     ["<S-tab>"] = cmp.mapping.select_prev_item(cmp_select),
--     ["<tab>"] = cmp.mapping.select_next_item(cmp_select),
--     ["<CR>"] = cmp.mapping.confirm({ select = false }),
--     ["<C-Space>"] = cmp.mapping.complete(),
-- })

-- cmp_mappings["<Tab>"] = nil
-- cmp_mappings["<S-Tab>"] = nil

-- lsp.setup_nvim_cmp({
--     mapping = cmp_mappings,
-- })
--
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

-- local has_words_before = function()
--     if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
-- end

-- cmp.setup({
-- 	window = {
-- 		completion = {
-- 			border = nil,
-- 		},
-- 		documentation = {
-- 			border = nil,
-- 		},
--
-- 		-- completion = cmp.config.window.bordered(),
-- 		-- documentation = cmp.config.window.bordered(),
-- 	},
-- 	mapping = cmp.mapping.preset.insert({
-- 		["<S-tab>"] = cmp.mapping.select_prev_item(cmp_select),
-- 		["<tab>"] = cmp.mapping.select_next_item(cmp_select),
-- 		-- ["<Tab>"] = vim.schedule_wrap(function(fallback)
-- 		--     if cmp.visible() and has_words_before() then
-- 		--         cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
-- 		--     else
-- 		--         fallback()
-- 		--     end
-- 		-- end),
-- 		["<CR>"] = cmp.mapping.confirm({ select = false }),
-- 		["<C-Space>"] = cmp.mapping.complete(),
-- 		["<C-u>"] = cmp.mapping.scroll_docs(-4),
-- 		["<C-d>"] = cmp.mapping.scroll_docs(4),
-- 	}),
-- })

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "●",
		warn = "●",
		hint = "●",
		info = "●",
	},
})

local opts = { remap = false }

vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, opts)
vim.keymap.set("n", "<leader>k", function()
	vim.lsp.buf.hover()
end, opts)
vim.keymap.set("n", "<leader>lf", function()
	vim.lsp.buf.format()
end, opts)
vim.keymap.set("n", "<leader>lo", function()
	vim.diagnostic.open_float()
end, opts)
vim.keymap.set("n", "<leader>ln", function()
	vim.diagnostic.goto_next()
end, opts)
vim.keymap.set("n", "<leader>lp", function()
	vim.diagnostic.goto_prev()
end, opts)
vim.keymap.set("n", "<leader>a", function()
	vim.lsp.buf.code_action()
end, opts)
vim.keymap.set("n", "<leader>vrr", function()
	vim.lsp.buf.references()
end, opts)
vim.keymap.set("n", "<leader>r", function()
	vim.lsp.buf.rename()
end, opts)
vim.keymap.set("i", "<C-h>", function()
	vim.lsp.buf.signature_help()
end, opts)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

cmp.setup({
	-- snippet = {
	-- 	expand = function(args)
	-- 		require("luasnip").lsp_expand(args.body)
	-- 	end,
	-- },

	-- completion = {
	-- 	completeopt = "menu,menuone,noselect",
	-- 	-- completeopt = "menu,menuone,noinsert",
	-- },
	window = {
		completion = {
			completeopt = "menu,menuone,noselect",
			border = nil,
		},
		documentation = {
			border = nil,
		},
	},

	experimental = {
		ghost_text = false,
	},

	-- window = {
	-- 	documentation = {
	-- 		-- border = nil,
	-- 		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	-- 		winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
	-- 	},
	-- 	completion = {
	-- 		scrollbar = false,
	-- 		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	-- 		winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
	-- 		col_offset = 3,
	-- 		side_padding = 0,
	-- 	},
	-- },

	formatting = {
		fields = { "kind", "abbr" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
				symbol_map = { Copilot = "" },
			})(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.abbr = (fixStringLength(vim_item.abbr))
			return kind
		end,
	},

	sources = {
		-- { name = "copilot", group_index = 2 },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "orgmode" },
		{ name = "buffer", keyword_length = 3 },
	},
})

-- yea yea gpt4 generated functions 💀
function fixStringLength(str)
	local length = 20 -- The fixed length you want for the string
	local strLen = #str -- Get the length of the input string

	-- Step 1: Truncate the string if it's longer than 20 characters
	if strLen > length - 3 then
		return string.sub(str, 1, length - 3) .. "..."
	end

	-- Step 2: Pad the string with spaces if it's shorter than 20 characters
	if strLen < length then
		local numSpaces = length - strLen -- Calculate the number of spaces needed
		local padding = string.rep(" ", numSpaces) -- Generate a string of spaces
		return str .. padding -- Concatenate the original string with the padding
	end

	-- Step 3: Return the string as-is if it's already 20 characters
	return str
end
