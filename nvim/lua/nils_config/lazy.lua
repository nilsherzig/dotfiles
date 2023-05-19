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

	"folke/which-key.nvim",

	"gelguy/wilder.nvim",

	"folke/neodev.nvim",

	{
		"projekt0n/github-nvim-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require('github-theme').setup({
				-- ...
			})

			vim.cmd('colorscheme github_dark_high_contrast')
		end,
	},

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' } 
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},

	"mbbill/undotree",
	"tpope/vim-fugitive",

})

local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})
