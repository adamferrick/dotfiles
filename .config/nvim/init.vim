" Vim-Plug plugins

call plug#begin()

Plug 'jeffkreeftmeijer/vim-dim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}

Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'

call plug#end()





" Space as leader
nnoremap <SPACE> <Nop>
let mapleader = " "


set number
set relativenumber

set scrolloff=3

set expandtab
set shiftwidth=4 softtabstop=4
filetype plugin indent on

set cursorline
set background=dark
colorscheme dim

" use mouse
set mouse=a

set title
set titlestring=%m\ %t\ (%f)\ -\ Neovim


" Show vertical line on cursor
nnoremap <Leader>c :set cursorcolumn!<CR>


" Copy to system clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y

" Paste from system clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P


" Persistent undo
set undodir=~/.vimdid
set undofile


" Configuring the statusline

hi StatusLine ctermfg=15 ctermbg=8

au InsertEnter * hi StatusLine ctermbg=1
au InsertLeave * hi StatusLine ctermbg=8

set laststatus=2
set statusline=
set statusline+=\ %f
set statusline+=\ %m
set statusline+=\ %=
set statusline+=%y
set statusline+=\ \ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \ \[%{&fileformat}\]
set statusline+=\ \ %p%%
set statusline+=\ \ %l:%c
set statusline+=\ 




set guicursor=a:blinkwait400-blinkoff400-blinkon400,n:block,i-ci-ve:ver25,r-cr:hor20



" plugin-specific config



" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    }
}
EOF
