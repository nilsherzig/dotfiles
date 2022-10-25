" ┌──────────────────────────────────────────────┐
" │ vim init, just loads lua and the color theme │
" └──────────────────────────────────────────────┘
source $HOME/.config/nvim/themes/mountain.vim
luafile $HOME/.config/nvim/lua/init.lua

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


" lsp stuff
Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'preservim/nerdtree'
call plug#end()
