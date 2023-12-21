highlight clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "refraction"


hi DiffAdd ctermfg=15 ctermbg=2
hi DiffChange ctermfg=15 ctermbg=3
hi DiffDelete ctermfg=15 ctermbg=1
hi DiffText ctermfg=15 ctermbg=11 cterm=bold

hi Visual ctermfg=15 ctermbg=4
hi Search ctermfg=15 ctermbg=1


hi MatchParen ctermfg=15 ctermbg=4


" The statusline should be red when there are unsaved changes in the buffer,
" blue otherwise
hi StatusLine ctermbg=4 cterm=NONE
function SetStatusBg() 
  if &mod == 1
    hi StatusLine ctermbg=1
  else
    hi StatusLine ctermbg=4
  endif
endfunction
au TextChanged,TextChangedI,BufWritePost,BufEnter * :call SetStatusBg()


" Ui chrome highlights
hi LineNr ctermfg=8
hi CursorLineNr ctermfg=4 cterm=bold,underline,italic
hi ColorColumn ctermbg=1
hi CursorColumn ctermbg=8
hi Folded ctermfg=8
hi FoldedColumn ctermfg=8
hi Pmenu ctermfg=NONE ctermbg=NONE
hi PmenuSel ctermfg=NONE ctermbg=4
hi SpellCap ctermbg=8
hi StatusLineNC ctermbg=8
hi WinSeparator ctermbg=8
hi SignColumn ctermbg=1



" Editor highlights
"
hi! link Conditional Keyword
hi! link PreProc Keyword
hi! link Special Operator
hi! link SpecialComment Comment
hi! link StringDelimiter String
hi! link Macro Function
hi! link Statement Function

hi! link htmlTagN Operator
hi! link htmlTag Operator
hi! link htmlEndTag Operator
hi! link htmlTagN Operator
hi! link htmlTagName Identifier

hi! link pythonStatement Keyword
hi! link pythonBuiltin Operator
hi! link pythonClassParameters Type

hi Comment ctermfg=8
hi Constant ctermfg=9
hi Error ctermfg=15 ctermbg=1
hi Function ctermfg=11 cterm=italic
hi Identifier ctermfg=12 cterm=NONE
hi Keyword ctermfg=5
hi Label ctermfg=5
hi Operator ctermfg=13
hi PreCondit ctermfg=3
hi SpecialChar ctermfg=3
hi Structure ctermfg=3
hi Type ctermfg=10
hi Todo ctermfg=4
hi Underlined cterm=underline
hi Title ctermfg=13 cterm=bold,italic
