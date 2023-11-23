--falsefalse vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- vim.opt.termguicolors = true
-- vim.g.sonokai_style = 'shusia'
-- vim.g.sonokai_better_performance = 1
-- vim.cmd('colorscheme sonokai')
--
-- require('github-theme').setup({
-- })

-- require("catppuccin").setup({
--     flavour = "mocha", -- latte, frappe, macchiato, mocha
--     background = {
--         -- :h background
--         light = "latte",
--         dark = "mocha",
--     },
--     transparent_background = true,
--     show_end_of_buffer = true, -- show the '~' characters after the end of buffers
--     term_colors = false,
--     dim_inactive = {
--         enabled = false,
--         shade = "dark",
--         percentage = 0.15,
--     },
--     no_italic = false,    -- Force no italic
--     no_bold = false,      -- Force no bold
--     no_underline = false, -- Force no underline
--     styles = {
--         comments = { "italic" },
--         conditionals = { "italic" },
--         loops = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--     },
--     color_overrides = {},
--     custom_highlights = function(colors)
--         return {
--             FloatBorder = {
--                 fg = colors.overlay2,
--             },
--             TelescopeBorder = {
--                 fg = colors.overlay2,
--             },
--             StatusLineNC = {
--                 fg = colors.surface1,
--                 bg = colors.base,
--             },
--             StatusLine = {
--                 fg = colors.overlay3,
--                 bg = colors.base,
--             },
--         }
--     end,
--     integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         notify = false,
--         mini = false,
--         -- indent_blankline = {
--         --     enabled = true
--         -- },
--         -- dropbar = {
--         --     enabled = false,
--         --     -- color_mode = false, -- enable color for kind's texts, not just kind's icons
--         -- },
--     },
-- })
-- vim.cmd('colorscheme github_light')
--
-- vim.o.background = "dark"
-- require("gruvbox").setup({
--   undercurl = true,
--   underline = true,
--   bold = true,
--   italic = {
--     strings = true,
--     comments = true,
--     operators = false,
--     folds = true,
--   },
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = true, -- invert background for search, diffs, statuslines and errors
--   contrast = "hard", -- can be "hard", "soft" or empty string
--   palette_overrides = {},
--   overrides = {},
--   dim_inactive = false,
--   transparent_mode = true,
-- })

-- vim.cmd('colorscheme gruvbox') -- load 1
-- vim.cmd('colorscheme gruvbox') -- load 2 - not a error theme is kinda weird
-- vim.cmd.colorscheme("catppuccin")

-- Default options:
require('kanagawa').setup({
    compile = true,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
