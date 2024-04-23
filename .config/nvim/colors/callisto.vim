hi DiffAdd ctermfg=15 ctermbg=2
hi DiffChange ctermfg=15 ctermbg=3
hi DiffDelete ctermfg=15 ctermbg=1
hi DiffText ctermfg=15 ctermbg=11 cterm=bold

hi Visual ctermfg=15 ctermbg=4
hi Search ctermfg=15 ctermbg=1

hi MatchParen ctermfg=15 ctermbg=4


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
hi! link htmlEndTag htmlTag
hi! link htmlTagName Type
hi! link htmlArg Identifier
hi! link xmlTagName htmlTagName
hi! link xmlTag htmlTag

hi! link @tag htmlTagName
hi! link @tag.delimiter htmlTag
hi! link @tag.attribute htmlArg

hi! link @constructor Type
hi! link @repeat Keyword
hi! link @type.qualifier Keyword
hi! link @conditional.ternary Operator

hi! link @exception Keyword


hi Comment ctermfg=8
hi Constant ctermfg=9
hi Error ctermfg=15 ctermbg=1
hi Function ctermfg=11
hi Identifier ctermfg=15 cterm=italic
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
