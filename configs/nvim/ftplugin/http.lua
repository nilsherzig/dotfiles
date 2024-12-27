vim.api.nvim_set_keymap("n", "<C-k>", ":lua require('kulala').jump_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", ":lua require('kulala').jump_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":lua require('kulala').run()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-i>", ":lua require('kulala').inspect()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-c>", ":lua require('kulala').copy()<CR>", { noremap = true, silent = true })

vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"<CR>",
	"<cmd>lua require('kulala').run()<cr>",
	{ noremap = true, silent = true, desc = "Execute the request" }
)
