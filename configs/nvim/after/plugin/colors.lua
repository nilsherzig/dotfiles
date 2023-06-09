-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- vim.opt.termguicolors = true
-- vim.g.sonokai_style = 'shusia'
-- vim.g.sonokai_better_performance = 1
-- vim.cmd('colorscheme sonokai')
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {
        -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    show_end_of_buffer = true, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = true,
        -- indent_blankline = {
        --     enabled = true
        -- },
        -- dropbar = {
        --     enabled = false,
        --     -- color_mode = false, -- enable color for kind's texts, not just kind's icons
        -- },
    },
})

vim.cmd.colorscheme("catppuccin")


