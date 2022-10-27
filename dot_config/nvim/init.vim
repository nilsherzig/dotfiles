" ┌──────────────────────────────────────────────┐
" │ vim init, just loads lua and the color theme │
" └──────────────────────────────────────────────┘

" source $HOME/.config/nvim/themes/mountain.vim
" autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"

" Bootstrap Plug
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path

call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

Plug 'jiangmiao/auto-pairs'

Plug 'lukas-reineke/indent-blankline.nvim'
" themes
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" code runner
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
Plug 'rcarriga/nvim-notify'

" term 
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
call plug#end()

lua << EOF
require("catppuccin").setup {
    flavour = "mocha", -- mocha, macchiato, frappe, latte
    transparent_background = true
}

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = false,
}
EOF

colorscheme catppuccin

luafile $HOME/.config/nvim/lua/init.lua

