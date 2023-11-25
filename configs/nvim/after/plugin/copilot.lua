-- vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- vim.g.copilot_no_tab_map = true
--
-- vim.g.copilot_filetypes = {
--     ['*'] = false,
--     ['markdown'] = true,
--     ['yaml'] = true,
--     ['go'] = true,
--     ['javascript'] = true,
--     ['html'] = true,
--     ['css'] = true,
-- }
-- require("copilot").setup(options)
require('copilot').setup({
    filetypes = {
        yaml = true,
        markdown = true,
        go = true,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
    },

    panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
        },
        layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
        },
    },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = "<tab>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
    },
    -- suggestion = { enabled = true },
    -- panel = { enabled = false },
    -- server_opts_overrides = {
    --     -- trace = "verbose",
    --     settings = {
    --         advanced = {
    --             -- listCount = 10, -- #completions for panel
    --             inlineSuggestCount = 3, -- #completions for getCompletions
    --         }
    --     },
    -- }
})

-- require("copilot_cmp").setup()
