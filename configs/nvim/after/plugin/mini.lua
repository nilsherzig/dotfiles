require('mini.align').setup()
require('mini.comment').setup(
-- No need to copy this inside `setup()`. Will be used automatically.
    {
        -- Options which control module behavior
        options = {
            -- Funtion to compute custom 'commentstring' (optional)
            -- TODO remove this if no longer needed
            custom_commentstring = function()
                local filetype = vim.bo.filetype
                if filetype == "nix" then
                    vim.bo.commentstring = "# %s"
                end
            end,

            -- Whether to ignore blank lines
            ignore_blank_line = false,

            -- Whether to recognize as comment only lines without indent
            start_of_line = false,

            -- Whether to ensure single space pad for comment parts
            pad_comment_parts = true,
        },

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
            -- Toggle comment (like `gcip` - comment inner paragraph) for both
            -- Normal and Visual modes
            comment = 'gc',

            -- Toggle comment on current line
            comment_line = 'gcc',

            -- Define 'comment' textobject (like `dgc` - delete whole comment block)
            textobject = 'gc',
        },

        -- Hook functions to be executed at certain stage of commenting
        hooks = {
            -- Before successful commenting. Does nothing by default.
            pre = function() end,
            -- After successful commenting. Does nothing by default.
            post = function() end,
        },
    }
)
require('mini.tabline').setup()
vim.api.nvim_set_hl(0, 'MiniTablineCurrent', {
    italic = true,
    bold = true,
    underline = false,
})

vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', {
    default = true,
    underline = true,
    fg = "red",
})

-- require('mini.cursorword').setup()
local miniclue = require('mini.clue')
miniclue.setup({
    triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
    },

    window = {
        delay = 0,
    },

    clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
    },
})
