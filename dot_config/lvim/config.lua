lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "catppuccin_mocha"
lvim.transparent_window = true

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"

lvim.builtin.alpha.active = false
lvim.builtin.alpha.mode = "dashboard" lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.gitsigns.opts.current_line_blame_opts.virt_text = true
lvim.builtin.gitsigns.opts.current_line_blame_opts.virt_text_pos = "right_align"

lvim.keys.visual_mode["aa"] = ":EasyAlign<CR>"

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

-- lvim.builtin.treesitter.highlight.enable = true

lvim.plugins = {
  {
    "catppuccin/vim",
    config = function()
      vim.api.nvim_set_hl(0, "TelescopeBorder", { bold = true })
      vim.api.nvim_set_hl(0, "CursorLineNr", { italic = true })
      vim.api.nvim_set_hl(0, "LineNr", { italic = true, fg = "#45475a" })
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
    "dhruvasagar/vim-table-mode"
  },
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
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require"lsp_signature".on_attach() end,
  },
  {
  'wfxr/minimap.vim',
    build = "cargo install --locked code-minimap",
    cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    config = function ()
      vim.cmd ("let g:minimap_width = 10")
      vim.cmd ("let g:minimap_auto_start = 1")
      vim.cmd ("let g:minimap_auto_start_win_enter = 1")
    end,
  },
  {
    'projekt0n/github-nvim-theme',
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    -- build = "cd app && yarn install",
    build = ":call mkdp#util#install()",
  },
  {
    'lervag/vimtex'
  },
  {
    'junegunn/vim-easy-align'
  }, 
}

lvim.builtin.indentlines.active = false

vim.wo.relativenumber = true
vim.g.languagetool_server = "/usr/share/java/languagetool/languagetool-server.jar"
vim.g.mkdp_theme = 'light'
vim.g.mkdp_auto_start = 0
vim.g.mkdp_page_title = "Notes: ${name}"
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.wo.spell = false
  end
})
