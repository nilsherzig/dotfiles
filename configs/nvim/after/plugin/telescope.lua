local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>d', builtin.diagnostics, {})

local actions = require("telescope.actions")

require("telescope").setup({ defaults = { mappings = { i = { ["<esc>"] = actions.close, }, }, }, })

-- vim.cmd [[
--   augroup TelescopeMappings
--     autocmd!
--     autocmd FileType TelescopePrompt inoremap <buffer> q <cmd>TelescopeCommand close<CR>
--   augroup END
-- ]]
