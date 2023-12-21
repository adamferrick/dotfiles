call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'uiiaoo/java-syntax.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'lunacookies/vim-rust-syntax-ext'
Plug 'kh3phr3n/python-syntax'
call plug#end()

nnoremap <SPACE> <Nop>
let mapleader = " "

set number

set scrolloff=3

set expandtab
set shiftwidth=4 softtabstop=4
filetype plugin indent on

set cursorline
set background=dark
colorscheme callisto

hi Search ctermbg=8

set mouse=a

set title
set titlestring=%m\ %t\ (%f)\ -\ Neovim

nnoremap <Leader>c :set cursorcolumn!<CR>

set undodir=~/.vimdid
set undofile

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

" View highlights under the cursor
function! SynStack ()
  for i1 in synstack(line('.'), col('.'))
    let i2 = synIDtrans(i1)
    let n1 = synIDattr(i1, 'name')
    let n2 = synIDattr(i2, 'name')
    echo n1 ' -> ' n2
  endfor
endfunc
nnoremap <Leader>h :call SynStack()<CR>
