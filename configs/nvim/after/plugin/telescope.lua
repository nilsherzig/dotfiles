local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>d', builtin.diagnostics, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})

local actions = require("telescope.actions")

require("telescope").setup({ defaults = { mappings = { i = { ["<esc>"] = actions.close, }, }, }, })

require('telescope').setup {
    -- preview_cutoff: When columns are less than this value, the preview will be disabled

    defaults = {
        layout_strategy = 'flex',
        layout_config = {
            height = 0.80,
            width = 0.80,
            preview_cutoff = 1,
        },
    },
}


require('telescope.pickers.layout_strategies').horizontal_merged = function(picker, max_columns, max_lines, layout_config)
    local layout = require('telescope.pickers.layout_strategies').horizontal(picker, max_columns, max_lines,
        layout_config)

    layout.prompt.title = ''
    layout.prompt.borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }

    layout.results.title = ''
    layout.results.borderchars = { '─', '│', '─', '│', '├', '┤', '┘', '└' }
    layout.results.line = layout.results.line - 1
    layout.results.height = layout.results.height + 1

    layout.preview.title = ''
    layout.preview.borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }

    return layout
end
