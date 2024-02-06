require("kanagawa").setup({
	compile = true, -- enable compiling the colorscheme
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = { italic = true },
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = { -- add/modify theme and palette colors
		palette = {},
		theme = {
			wave = {
				-- ui = {
				-- 	float = { bg = "#1c1c1c", fg = "#e0e0e0" },
				-- },
			},
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
			lotus = {},
			dragon = {},
		},
	},
	overrides = function(colors) -- add/modify highlights
		local theme = colors.theme
		return {
			-- Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
			-- PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
			-- PmenuSbar = { bg = theme.ui.bg_m1 },
			-- PmenuThumb = { bg = theme.ui.bg_p2 },
		}
	end,
	theme = "wave", -- Load "wave" theme when 'background' option is not set
	background = { -- map the value of 'background' option to a theme
		dark = "wave", -- try "dragon" !
		light = "lotus",
	},
})

-- vim.cmd("colorscheme kanagawa")

vim.g.background = "dark"
vim.g.gruvbox_material_background = "hard"
-- vim.g.gruvbox_material_better_performance = 1

vim.cmd("colorscheme gruvbox-material")
