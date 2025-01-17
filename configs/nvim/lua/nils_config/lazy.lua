vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
	},
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble cascade toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"stevearc/conform.nvim",
	},
	{
		"stevearc/oil.nvim",
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"numToStr/Comment.nvim",
	},
	{
		"lewis6991/gitsigns.nvim",
	},
	{
		"brenoprata10/nvim-highlight-colors",
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"VonHeikemen/lsp-zero.nvim",
	},
	{
		"echasnovski/mini.nvim",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"onsails/lspkind.nvim",
		},
	},
	{
		"L3MON4D3/LuaSnip",
		build = "LUA_LDLIBS=-lluajit5.1 make install_jsregexp",
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"github/copilot.vim",
	},
	{
		"someone-stole-my-name/yaml-companion.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("yaml_schema")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
	},
	{
		"Rawnly/gist.nvim",
		cmd = { "GistCreate", "GistCreateFromFile", "GistsList" },
		config = true,
	},
	-- `GistsList` opens the selected gif in a terminal buffer,
	-- nvim-unception uses neovim remote rpc functionality to open the gist in an actual buffer
	-- and prevents neovim buffer inception
	{
		"samjwill/nvim-unception",
		lazy = false,
		init = function()
			vim.g.unception_block_while_host_edits = true
		end,
	},
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
	},
	{
		-- Install markdown preview, use npx if available.
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function(plugin)
			if vim.fn.executable("npx") then
				vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
			else
				vim.cmd([[Lazy load markdown-preview.nvim]])
				vim.fn["mkdp#util#install"]()
			end
		end,
		init = function()
			-- if vim.fn.executable("npx") then
			vim.g.mkdp_filetypes = { "markdown" }
			-- end
		end,
	},
	-- {
	-- 	"OXY2DEV/markview.nvim",
	-- 	lazy = false, -- Recommended
	-- 	-- ft = "markdown" -- If you decide to lazy-load anyway
	--
	-- 	dependencies = {
	-- 		-- You will not need this if you installed the
	-- 		-- parsers manually
	-- 		-- Or if the parsers are in your $RUNTIMEPATH
	-- 		"nvim-treesitter/nvim-treesitter",
	--
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- },
	{
		"barreiroleo/ltex_extra.nvim",
		branch = "dev",
		ft = { "markdown", "tex" },
		opts = {
			---@type string[]
			-- See https://valentjn.github.io/ltex/supported-languages.html#natural-languages
			load_langs = { "en-US", "de-DE" },
			---@type "none" | "fatal" | "error" | "warn" | "info" | "debug" | "trace"
			log_level = "none",
			---@type string File's path to load.
			-- The setup will normalice it running vim.fs.normalize(path).
			-- e.g. subfolder in project root or cwd: ".ltex"
			-- e.g. cross project settings:  vim.fn.expand("~") .. "/.local/share/ltex"
			path = ".ltex",
			---@deprecated
			init_check = true,
			---@deprecated
			server_start = false,
			---@deprecated
			server_opts = nil,
		},
	},
	{
		"mistweaverco/kulala.nvim",
		opts = {
			debug = true,
		},
	},
	-- {
	-- 	"CopilotC-Nvim/CopilotChat.nvim",
	-- 	branch = "canary",
	-- 	dependencies = {
	-- 		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
	-- 		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	-- 	},
	-- 	build = "make tiktoken", -- Only on MacOS or Linux
	-- 	opts = {
	-- 		debug = true, -- Enable debugging
	-- 		-- See Configuration section for rest
	-- 	},
	-- 	-- See Commands section for default commands if you want to lazy load on them
	-- },
	-- {
	-- 	"yetone/avante.nvim",
	-- 	event = "VeryLazy",
	-- 	lazy = false,
	-- 	version = false, -- set this if you want to always pull the latest change
	-- 	opts = {
	-- 		-- add any opts here
	-- 	},
	-- 	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	-- 	build = "make",
	-- 	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"stevearc/dressing.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"MunifTanjim/nui.nvim",
	-- 		--- The below dependencies are optional,
	-- 		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
	-- 		"zbirenbaum/copilot.lua", -- for providers='copilot'
	-- 		{
	-- 			-- support for image pasting
	-- 			"HakonHarnes/img-clip.nvim",
	-- 			event = "VeryLazy",
	-- 			opts = {
	-- 				-- recommended settings
	-- 				default = {
	-- 					embed_image_as_base64 = false,
	-- 					prompt_for_file_name = false,
	-- 					drag_and_drop = {
	-- 						insert_mode = true,
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 		{
	-- 			-- Make sure to set this up properly if you have lazy=true
	-- 			"MeanderingProgrammer/render-markdown.nvim",
	-- 			opts = {
	-- 				file_types = { "markdown", "Avante" },
	-- 			},
	-- 			ft = { "markdown", "Avante" },
	-- 		},
	-- 	},
	-- },
	"dhruvasagar/vim-table-mode",
	-- "tpope/vim-fugitive",
	-- THEMES
	"rebelot/kanagawa.nvim",
	-- "projekt0n/github-nvim-theme",
	-- "ab-dx/ares.nvim",
	-- "mellow-theme/mellow.nvim",
	-- "RRethy/base16-nvim",
	"Mofiqul/vscode.nvim",
	"lambdalisue/fern.vim",
	"lambdalisue/vim-fern-git-status",
	"morhetz/gruvbox",
	-- {
	-- 	"kaarmu/typst.vim",
	-- 	ft = "typst",
	-- 	lazy = false,
	-- },
	-- "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- Custom Parameters (with defaults)
	{
		"dgagn/diagflow.nvim",
		event = "LspAttach",
		opts = {},
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({})
		end,
	},
	{
		"chomosuke/typst-preview.nvim",
		lazy = false, -- or ft = 'typst'
		version = "1.*",
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
	},
})
