face global value bright-red
face global type bright-green
face global variable bright-white
face global module green
face global function bright-yellow
face global string bright-red
face global keyword magenta
face global operator bright-magenta
face global attribute green
face global comment bright-black
face global documentation comment
face global meta magenta

face global PrimaryCursor black,bright-white+b
face global PrimaryCursorEol PrimaryCursor

face global PrimarySelection bright-white,blue

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

face global LineNumbers bright-black
face global LineNumberCursor bright-white,blue+bi

face global StatusLine bright-white,blue
face global StatusLineInfo bright-white
face global StatusLineMode StatusLineInfo
face global Information bright-white,blue

face global Error bright-white,red

face global MenuBackground bright-white,bright-black
face global MenuForeground bright-white,blue+bui
face global MenuInfo bright-white

face global StatusCursor PrimaryCursor
face global Prompt bright-white

face global crosshairs_line default,default+u
face global crosshairs_column default,default+u
