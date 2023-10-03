require("nvim-tree").setup {
    git = {
        enable = false
    },
    view = {
        centralize_selection = true,
        adaptive_size = true,
        side = "right",
        preserve_window_proportions = true,
        float = {
            enable = true,
            quit_on_focus_loss = true,
            open_win_config = function()
                return {
                    row = 3,
                    width = 60,
                    border = "rounded",
                    relative = "editor",
                    col = vim.o.columns,
                    height = vim.o.lines - 15,
                }
            end,
        },
    },
}
