vim.g.background = "dark"

-- require("base16-colorscheme").with_config({
-- 	telescope = false,
-- 	indentblankline = false,
-- 	notify = true,
-- 	ts_rainbow = true,
-- 	cmp = true,
-- 	illuminate = true,
-- 	dapui = true,
-- })
-- vim.cmd("colorscheme roseprime")
-- vim.cmd("colorscheme vscode")

-- local c = require("vscode.colors").get_colors()
-- require("vscode").setup({
-- 	italic_comments = true,
-- 	underline_links = true,
-- 	disable_nvimtree_bg = true,
-- })
-- require("vscode").load()

-- load the theme without affecting devicon colors.
-- vim.cmd.colorscheme("vscode")
-- vim.cmd.colorscheme("kanagawa")
-- vim.cmd("colorscheme iceclimber")
-- vim.cmd("colorscheme base16-gruvbox-material-dark-hard")
--
-- Default options:
-- require("kanagawa").setup({
-- 	compile = true, -- enable compiling the colorscheme
-- 	undercurl = true, -- enable undercurls
-- 	commentStyle = { italic = true },
-- 	functionStyle = { italic = true },
-- 	keywordStyle = { italic = true },
-- 	statementStyle = { bold = true },
-- 	typeStyle = {},
-- 	transparent = false, -- do not set background color
-- 	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
-- 	terminalColors = true, -- define vim.g.terminal_color_{0,17}
-- 	theme = "dragon", -- Load "wave" theme when 'background' option is not set
-- })

-- setup must be called before loading
vim.cmd("colorscheme kanagawa-dragon")
-- vim.cmd("colorscheme vscode")
-- g:gruvbox_contrast_dark
-- vim.g.gruvbox_contrast_dark = "hard"
-- vim.cmd("colorscheme gruvbox")
