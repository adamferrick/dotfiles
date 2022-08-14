" Vim-Plug plugins

call plug#begin()

Plug 'jeffkreeftmeijer/vim-dim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}

Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'

call plug#end()





set number
set relativenumber

set scrolloff=3

set expandtab
set shiftwidth=4 softtabstop=4
filetype plugin indent on

set cursorline
set background=dark
colorscheme dim
hi TabLine	ctermfg=15	ctermbg=8	cterm=bold
hi TabLineFill	ctermfg=15	ctermbg=8	cterm=bold
hi TabLineSel	ctermfg=8	ctermbg=15	cterm=bold

au InsertEnter * hi TabLine ctermbg=1
au InsertEnter * hi TabLineFill ctermbg=1
au InsertEnter * hi TabLineSel ctermfg=1

au InsertLeave * hi TabLine ctermbg=8
au InsertLeave * hi TabLineFill ctermbg=8
au InsertLeave * hi TabLineSel ctermfg=8

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


" Configuring the tabline
" Modified from http://www.offensivethinking.org/data/dotfiles/vimrc
if exists("+showtabline")
  function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
      " set up some oft-used variables
      let tab = i + 1 " range() starts at 0
      let winnr = tabpagewinnr(tab) " gets current window of current tab
      let buflist = tabpagebuflist(tab) " list of buffers associated with the windows in the current tab
      let bufnr = buflist[winnr - 1] " current buffer number
      let bufname = bufname(bufnr) " gets the name of the current buffer in the current window of the current tab
      let bufmodified = getbufvar(bufnr, "&mod")

      let s .= '%' . tab . 'T' " start a tab
      let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#') " if this tab is the current tab...set the right highlighting
      let s .= ' ' . tab " current tab number
      let n = tabpagewinnr(tab,'$') " get the number of windows in the current tab
      if n > 1
        let s .= ':' . n " if there's more than one, add a colon and display the count
      endif
      if bufmodified
        let s .= ' [+]'
      endif
      if bufname != ''
        let s .= ' ' . fnamemodify(bufname, ':t') . ' ' " outputs the filename
      else
        let s .= ' [No Name] '
      endif
      if tab == tabpagenr()
        let s .= '%#TabLine#'
        let s .= ''
      elseif tab == tabpagenr() - 1
        let s .= '%#TabLineSel#'
        let s .= ''
      else
        let s .= ''
      endif
    endfor
    let s .= '%#TabLineFill#' " blank highlighting between the tabs and the righthand close 'X'
    let s .= '%T' " resets tab page number?
    let s .= '%=' " seperate left-aligned from right-aligned
    let s .= '%#TabLine#' " set highlight for the 'X' below
    let s .= '%999XX' " places an 'X' at the far-right
    return s
  endfunction
  set tabline=%!MyTabLine()
endif


" Configuring the statusline
" Modified from https://shapeshed.com/vim-statuslines/
set laststatus=2
set statusline=
set statusline+=%#TabLine#
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
