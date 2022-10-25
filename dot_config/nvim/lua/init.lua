local opt = vim.opt
local g = vim.g
-- ┌──────────────────┐
-- │ general settings │
-- └──────────────────┘
opt.undofile = true 
opt.undodir = "/home/nils/.cache"

-- ┌────────────────┐
-- │ tabs vs spaces │
-- └────────────────┘
opt.smartindent = true
opt.autoindent = true 
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true


-- ┌───────────────┐
-- │ fix clipboard │
-- └───────────────┘
opt.clipboard = "unnamedplus"

-- ┌─────────────┐
-- │ ui settings │
-- └─────────────┘
vim.o.relativenumber = true

-- ┌─────────────────┐
-- │ plugin settings │
-- └─────────────────┘
-- require'nvim-treesitter.configs'.setup {
--   highlight = {
--     enable = true,
--     additional_vim_regex_highlighting = false,
--   },
-- }

-- ┌────────────────────────────────────────────────────────┐
-- │ extra lsp settings (TODO move to async file in future) │
-- └────────────────────────────────────────────────────────┘

-- require'lspconfig'.clangd.setup{}
require'lspconfig'.eslint.setup{}
-- 
-- -- autocomplete with lsp
-- require'compe'.setup{
--     enabled = true; 
--     autocomplete = true; 
--     debug = false; 
--     min_length = 1; 
--     preselect = enable; 
--     source = {
--         path = true; 
--         nvim_lsp = true;
--         nvim_lua = true; 
--         buffer = true; 
--         tags = true; 
--         treesitter = true; 
--         text = true; 
--     }
-- }
-- 
-- -- switch though autocompletion via tab
-- local t = function(str)
--   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end
-- 
-- local check_back_space = function()
--     local col = vim.fn.col('.') - 1
--     return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
-- end
-- 
-- -- Use (s-)tab to:
-- --- move to prev/next item in completion menuone
-- --- jump to prev/next snippet's placeholder
-- _G.tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t "<C-n>"
--   elseif vim.fn['vsnip#available'](1) == 1 then
--     return t "<Plug>(vsnip-expand-or-jump)"
--   elseif check_back_space() then
--     return t "<Tab>"
--   else
--     return vim.fn['compe#complete']()
--   end
-- end
-- _G.s_tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t "<C-p>"
--   elseif vim.fn['vsnip#jumpable'](-1) == 1 then
--     return t "<Plug>(vsnip-jump-prev)"
--   else
--     -- If <S-Tab> is not working in your terminal, change it to <C-h>
--     return t "<S-Tab>"
--   end
-- end
-- 
-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- 
-- vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
-- 
-- 
-- vim.api.nvim_set_keymap("n", "<Space>", ":NERDTreeToggle<CR>", { silent = true })
