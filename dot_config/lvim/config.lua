lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "catppuccin_mocha"
-- lvim.colorscheme = "wal"
-- lvim.colorscheme = "rose-pine"
lvim.transparent_window = true

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.plugins = {
  {
    "catppuccin/vim",
    config = function()
      vim.api.nvim_set_hl(0, "TelescopeBorder", { bold = true })
      vim.api.nvim_set_hl(0, "CursorLineNr", { italic = true })
      vim.api.nvim_set_hl(0, "LineNr", { italic = true, fg = "#45475a" })
      -- vim.api.nvim_set_hl(0, "CursorLine", { italic = true, fg = "#45475a" })
    end,
  },
  -- {
  --   "rose-pine/neovim",
  --   config = function()
  --     require("rose-pine").setup()
  --   end,
  -- },
  {
    "tpope/vim-fugitive"
  },
  {
    "airblade/vim-gitgutter"
  },
  {
    "dhruvasagar/vim-table-mode"
  },
  -- {
  --   "rhysd/vim-grammarous"
  -- },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.indentscope').setup(
        {
          draw = {
            delay = 20,
          },
          symbol = '│',
        }
      )
    end,
  },
  {
    "dylanaraps/wal.vim"
  },
  {
    "nvim-orgmode/orgmode",
    config = function()
      require('orgmode').setup(
        {
          org_agenda_files = { '~/org/*' },
          org_default_notes_file = '~/org/refile.org',
        },
        require('orgmode').setup_ts_grammar()
      )
    end,
  },
  --   {
  --     "vigoux/LanguageTool.nvim"
  --   }
}


lvim.builtin.indentlines.active = false

vim.wo.relativenumber = true
vim.g.languagetool_server = "/usr/share/java/languagetool/languagetool-server.jar"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})
-- i fucking hate this solution
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.wo.spell = false
    -- vim.opt.termguicolors = false
  end
})
