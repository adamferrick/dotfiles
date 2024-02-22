call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()



nnoremap <SPACE> <Nop>
let mapleader = " "

set number

set scrolloff=3

set expandtab
set shiftwidth=4 softtabstop=4
filetype indent off

set cursorline
set background=dark
colorscheme callisto

hi Search ctermbg=8

set mouse=a

set title
set titlestring=%m\ %t\ (%f)\ -\ Neovim

" The statusline should be red when there are unsaved changes in the buffer,
" blue otherwise.
hi StatusLine ctermbg=4 cterm=NONE
function SetStatusBg()
  if &mod == 1
    hi StatusLine ctermbg=1
  else
    hi StatusLine ctermbg=4
  endif
endfunction
au TextChanged,TextChangedI,BufWritePost,BufEnter * :call SetStatusBg()


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

" plugin-specific config

" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "csv",
    "dockerfile",
    "fish",
    "gitignore",
    "haskell",
    "java",
    "javascript",
    "julia",
    "latex",
    "make",
    "python",
    "r",
    "rust",
    "sql",
    "supercollider",
    "toml",
    "typescript",
    "vim",
  },
}
EOF
