local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>d", builtin.diagnostics, {})
vim.keymap.set("n", "gr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>gs", builtin.live_grep, {})
vim.keymap.set("n", "<leader>t", builtin.builtin, {})

vim.keymap.set("n", "<leader>s", function()
    builtin.lsp_document_symbols({ symbol_width = 160 })
end, {})
vim.keymap.set("n", "<leader>S", function()
    builtin.lsp_dynamic_workspace_symbols({ symbol_width = 160 })
end, {})

telescope.setup({
    pickers = {
        find_files = {
            hidden = true
        }
    },
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
        layout_strategy = "flex",
        borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
        results_title = false,
        prompt_title = false,
        preview_title = false,
        selection_caret = "  ",
    },
})
