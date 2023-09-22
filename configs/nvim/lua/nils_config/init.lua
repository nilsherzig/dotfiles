require("nils_config.remap")
require("nils_config.lazy")

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- Enable line wrap for markdown files
vim.cmd([[
  augroup MarkdownSettings
    autocmd!
    autocmd FileType markdown setlocal wrap
  augroup END
]])

-- Use j and k in line wrapped lines
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 0 -- might harm your ssd - something about swap files

-- vim.opt.colorcolumn = "80"
-- vim.opt.textwidth = 80

require("nils_config.autocommands")

require('colorizer').setup()
-- require('orgmode').setup_ts_grammar()
--
-- require('orgmode').setup({
--   org_agenda_files = {'~/org/*'},
--   org_default_notes_file = '~/org/refile.org',
-- })
-- require('org-bullets').setup()
require('mkdnflow').setup({
})


require 'clipboard-image'.setup {
    -- Default configuration for all filetype
    default = {
        img_dir = "img",
        img_name = function() return os.date('%Y-%m-%d-%H-%M-%S') end, -- Example result: "2021-04-13-10-04-18"
        affix = "<\n  %s\n>"                                           -- Multi lines affix
    },
}

require("nvim-tree").setup {
    view = {
        centralize_selection = true,
        adaptive_size = false,
        side = "right",
        preserve_window_proportions = true,
        float = {
            enable = true,
            quit_on_focus_loss = true,
            open_win_config = function()
                return {
                    row = 0,
                    width = 30,
                    border = "rounded",
                    relative = "editor",
                    col = vim.o.columns,
                    height = vim.o.lines - 3,
                }
            end,
        },
    },
}

require("yaml-companion")
require("telescope").load_extension("yaml_schema")
