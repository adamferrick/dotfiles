set-face global PrimaryCursor black,bright-white+b
set-face global PrimaryCursorEol PrimaryCursor

set-face global PrimarySelection bright-white,blue

hook global ModeChange (push|pop):insert:.* %{
    set-face window StatusLine bright-white,blue
    set-face window LineNumberCursor bright-white,blue+bui
    set-face window MenuForeground bright-white,blue+bui
    set-face window PrimarySelection bright-white,blue
    set-face window Information bright-white,blue
}
hook global ModeChange (push|pop):.*:insert %{
    set-face window StatusLine bright-white,red
    set-face window LineNumberCursor bright-white,red+bui
    set-face window MenuForeground bright-white,red+bui
    set-face window PrimarySelection bright-white,red
    set-face window Information bright-white,red
}

set-face global LineNumbers bright-black
set-face global LineNumberCursor bright-white,blue+bi

set-face global StatusLine bright-white,blue
set-face global StatusLineInfo bright-white
set-face global StatusLineMode StatusLineInfo
set-face global Information bright-white,blue

set-face global Error bright-white,red

set-face global MenuBackground bright-white,bright-black
set-face global MenuForeground bright-white,blue+bui
set-face global MenuInfo bright-white

set-face global StatusCursor PrimaryCursor
set-face global Prompt bright-white

set-face global crosshairs_line default,default+u
set-face global crosshairs_column default,default+u

# Code
set-face global value ts_constant
set-face global type ts_type
set-face global variable ts_variable
set-face global module ts_namespace
set-face global function ts_function
set-face global string ts_string
set-face global keyword ts_keyword
set-face global operator ts_operator
set-face global attribute ts_attribute
set-face global comment ts_comment
set-face global documentation comment

# Treesitter
set-face global ts_constant bright-red
set-face global ts_type bright-green
set-face global ts_variable bright-white
set-face global ts_namespace ts_variable
set-face global ts_function bright-yellow
set-face global ts_string bright-red
set-face global ts_keyword magenta
set-face global ts_operator bright-magenta
set-face global ts_punctuation bright-magenta
set-face global ts_attribute green
set-face global ts_comment bright-black
set-face global ts_constructor bright-green
set-face global ts_property bright-magenta

set-face global ts_markup_bold bright-white+b
set-face global ts_markup_italic bright-white+i
set-face global ts_markup_heading bright-green+bui
set-face global ts_markup_list_checked bright-magenta
set-face global ts_markup_list_numbered bright-magenta
set-face global ts_markup_list_unchecked bright-magenta
set-face global ts_markup_list_unnumbered bright-magenta
set-face global ts_markup_link_label bright-red
set-face global ts_markup_link_url bright-red
set-face global ts_markup_link_uri bright-red
set-face global ts_markup_link_text bright-red
set-face global ts_markup_quote default
set-face global ts_markup_raw default

set-face global ts_label bright-magenta
