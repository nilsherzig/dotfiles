lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "catppuccin_mocha"
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
      vim.api.nvim_set_hl(0, "CursorLine", { italic = true, fg = "#45475a" })
    end,
  },
  {
    "tpope/vim-fugitive"
  },
  {
    "airblade/vim-gitgutter"
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
  }
}

lvim.builtin.indentlines.active = false

vim.wo.relativenumber = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

-- autocmd BufWritePost  ! chezmoi apply --source-path "%"
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "~/.local/share/chezmoi/*",
  callback = function()
    vim.fn.system(ls)
  end
})
