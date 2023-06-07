local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- {
    --     "nvim-lualine/lualine.nvim",
    -- },

    { "lukas-reineke/indent-blankline.nvim" },
    { 'akinsho/bufferline.nvim',            dependencies = 'nvim-tree/nvim-web-devicons' },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
        },
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        -- config = function()
            --     require("null-ls").setup()
            -- end,
            -- requires = { "nvim-lua/plenary.nvim" },
        },

        {
            "folke/which-key.nvim",
            config = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
                require("which-key").setup({
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                })
            end,
        },

        {
            "yamatsum/nvim-cursorline",
            config = function()
                require("nvim-cursorline").setup({
                    cursorline = {
                        enable = false,
                        timeout = 1000,
                        number = false,
                    },
                    cursorword = {
                        enable = true,
                        min_length = 3,
                        hl = { underline = true },
                    },
                })
            end,
        },

        "gelguy/wilder.nvim",

        "folke/neodev.nvim",

        "jiangmiao/auto-pairs",

        {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("gitsigns").setup()
            end,
        },

        {
            "terrortylor/nvim-comment",
            config = function()
                require("nvim_comment").setup()
            end,
        },

        "sainnhe/sonokai",

        -- {
            --     "projekt0n/github-nvim-theme",
            --     lazy = false,    -- make sure we load this during startup if it is your main colorscheme
            --     priority = 1000, -- make sure to load this before all the other start plugins
            --     config = function()
                --         require('github-theme').setup({
                    --             -- ...
                    --         })
                    --
                    --         vim.cmd('colorscheme github_dark_high_contrast')
                    --     end,
                    -- },
                    --
                    {
                        "catppuccin/nvim",
                        name = "catppuccin",
                        config = function()
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
                                    mini = false,
                                },
                            })

                            vim.cmd.colorscheme("catppuccin")
                        end,
                    },

                    -- {
                        -- 	"iamcco/markdown-preview.nvim",
                        -- 	config = function()
                            -- 		vim.fn["mkdp#util#install"]()
                            -- 	end,
                            -- },

                            {
                                "preservim/vim-markdown",
                                require = { "godlygeek/tabular" },
                            },

                            {
                                'mfussenegger/nvim-dap'
                            },

                            {
                                'rcarriga/nvim-dap-ui',
                                config = function()
                                    require("dapui").setup({
                                        controls = {
                                            element = "repl",
                                            enabled = true,
                                            icons = {
                                                disconnect = "",
                                                pause = "",
                                                play = "",
                                                run_last = "",
                                                step_back = "",
                                                step_into = "",
                                                step_out = "",
                                                step_over = "",
                                                terminate = ""
                                            }
                                        },
                                        element_mappings = {},
                                        expand_lines = true,
                                        floating = {
                                            border = "single",
                                            mappings = {
                                                close = { "q", "<Esc>" }
                                            }
                                        },
                                        force_buffers = true,
                                        icons = {
                                            collapsed = "",
                                            current_frame = "",
                                            expanded = ""
                                        },
                                        layouts = {
                                            -- {
                                            --     elements = {
                                                --  {
                                            --         id = "scopes",
                                            --         size = 0.25
                                            --     }, 
                                            --     {
                                            --         id = "breakpoints",
                                            --         size = 0.25
                                            --     }, {
                                            --         id = "stacks",
                                            --         size = 0.25
                                            --     }, {
                                            --         id = "watches",
                                            --         size = 0.25
                                            --     } },
                                            --     position = "left",
                                            --     size = 80
                                            -- }, 
                                        {
                                            elements = {
                                                {
                                                    id = "repl",
                                                    size = 1
                                                },
                                        },
                                            position = "bottom",
                                            size = 10
                                        },
                                        {
                                            elements = {
                                                {
                                                    id = "watches",
                                                    size = 1
                                                },
                                        },
                                            position = "top",
                                            size = 10
                                        }
                                    },
                                        mappings = {
                                            edit = "e",
                                            expand = { "<CR>", "<2-LeftMouse>" },
                                            open = "o",
                                            remove = "d",
                                            repl = "r",
                                            toggle = "t"
                                        },
                                        render = {
                                            indent = 1,
                                            max_value_lines = 100
                                        }
                                    })
                                end,
                            },

                            {
                                'leoluz/nvim-dap-go',
                                config = function()
                                    require('dap-go').setup()
                                end,
                            },

                            {
                                'mfussenegger/nvim-jdtls'
                            },

                            {
                                "nvim-telescope/telescope.nvim",
                                tag = "0.1.1",
                                dependencies = { "nvim-lua/plenary.nvim" },
                            },
                            {
                                "nvim-treesitter/nvim-treesitter",
                                build = ":TSUpdate",
                            },

                            -- "mbbill/undotree",

                            "tpope/vim-fugitive",

                            {
                                "andrewferrier/wrapping.nvim",
                                config = function()
                                    require("wrapping").setup()
                                end,
                            },

                            {
                                "VonHeikemen/lsp-zero.nvim",
                                lazy = false,
                                branch = "v2.x",
                                dependencies = {
                                    -- LSP Support
                                    { "neovim/nvim-lspconfig" }, -- Required
                                    {
                                        -- Optional
                                        "williamboman/mason.nvim",
                                        build = function()
                                            pcall(vim.cmd, "MasonUpdate")
                                        end,
                                    },
                                    { "williamboman/mason-lspconfig.nvim" }, -- Optional

                                    -- Autocompletion
                                    { "hrsh7th/nvim-cmp" }, -- Required
                                    { "hrsh7th/cmp-nvim-lsp" }, -- Required
                                    { "L3MON4D3/LuaSnip" }, -- Required
                                },
                            },
                        })

                        local wilder = require("wilder")
                        wilder.setup({ modes = { ":", "/", "?" } })
