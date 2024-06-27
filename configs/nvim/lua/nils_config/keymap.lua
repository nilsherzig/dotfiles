vim.g.mapleader = " "

vim.keymap.set("n", "<C-c>", "<cmd>BufferClose<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<S-tab>", "<cmd>NvimTreeFindFileToggle<CR>")
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("v", "<leader>y", "+y")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "H", "<cmd>BufferPrevious<CR>")
vim.keymap.set("n", "L", "<cmd>BufferNext<CR>")

vim.api.nvim_set_keymap("n", "<leader>go", ":G<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gp", ":G push<CR>", { noremap = true, silent = true })

-- save file on pressing ü in normal mode
vim.api.nvim_set_keymap("n", "ü", ":w<CR>", { noremap = true, silent = false })

-- exit insert mode when pressing kj or kj
-- vim.api.nvim_set_keymap("i", "kj", "<Esc>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-c>", "<Esc>")
-- vim.keymap.set("i", "<Esc>", "")

-- save file on exiting insert mode
-- vim.api.nvim_set_keymap("i", "<Esc>", "<Esc>:w<CR>", { noremap = true, silent = true })
-- Use j and k in line wrapped lines
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
