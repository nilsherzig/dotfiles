require("nils_config.keymap")
require("nils_config.lazy")

vim.opt.laststatus = 3

vim.loader.enable()

vim.wo.fillchars = "eob: "

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

-- vim.opt.relativenumber = true
vim.opt.nu = true

vim.opt.showbreak = "↪ "
vim.opt.linebreak = true
vim.opt.wrap = true
-- vim.opt.colorcolumn = "80"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Enable line wrap for markdown files
-- vim.cmd([[
--   augroup MarkdownSettings
--     autocmd!
--     autocmd FileType markdown setlocal wrap
--   augroup END
-- ]])

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
-- vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- vim.opt.updatetime = 0 -- might harm your ssd - something about swap files
--
-- vim.lsp.inlay_hint.enable(bufnr)
--
vim.filetype.add({
	extension = {
		["http"] = "http",
	},
})
