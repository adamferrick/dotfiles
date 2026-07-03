config.load_autoconfig()

c.content.blocking.method = 'both'

config.set('content.headers.user_agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36')

config.bind('F', 'hint all window')

config.bind('<Alt-Space>', 'mode-leave', mode='insert')
config.bind('<Alt-Space>', 'mode-leave', mode='caret')

config.bind('pw', 'spawn --userscript qute-pass', mode='normal')
config.bind(',u', 'spawn --userscript qute-pass --username-only', mode='normal')
config.bind(',p', 'spawn --userscript qute-pass --password-only', mode='normal')


c.window.title_format = "{private}{current_title}{title_sep}qutebrowser"
c.colors.webpage.darkmode.enabled = True

c.fonts.default_family = 'BlexMono Nerd Font'
c.fonts.default_size = '11pt'

black = "#0f141a"
blue = "#396c9e"
cyan = "#519ca6"
green = "#769c51"
magenta = "#8c81c9"
red = "#b3451d"
white = "#bbb1b1"
yellow = "#bd7039"
bright_black = "#485251"
bright_blue = "#549ee3"
bright_cyan = "#a7e7eb"
bright_green = "#c3db69"
bright_magenta = "#e89df2"
bright_red = "#e06a46"
bright_white = "#f6f6f6"
bright_yellow = "#e8c95a"

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = bright_white

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = bright_black

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = bright_black

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = bright_white

# Background color of the completion widget category headers.
c.colors.completion.category.bg = blue

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = bright_black

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = bright_black

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = bright_white

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = blue

# Top border color of the selected completion item.
c.colors.completion.item.selected.border.top = blue

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = blue

# Foreground color of the matched text in the selected completion item.
c.colors.completion.item.selected.match.fg = bright_white

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = bright_white

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = bright_white

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = black

# Background color of disabled items in the context menu.
c.colors.contextmenu.disabled.bg = black

# Foreground color of disabled items in the context menu.
c.colors.contextmenu.disabled.fg = bright_black

# Background color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.bg = bright_black

# Foreground color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.fg =  bright_white

# Background color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.bg = blue

#Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.fg = bright_white

# Background color for the download bar.
c.colors.downloads.bar.bg = black

# Color gradient start for download text.
c.colors.downloads.start.fg = bright_white

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = black

# Color gradient end for download text.
c.colors.downloads.stop.fg = bright_white

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = blue

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = bright_red

# Font color for hints.
c.colors.hints.fg = bright_white

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
c.colors.hints.bg = blue

# Font color for the matched part of hints.
c.colors.hints.match.fg = bright_white

# Border for hints.
c.hints.border = 'none'

# Text color for the keyhint widget.
c.colors.keyhint.fg = bright_white

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = bright_white

# Background color of the keyhint widget.
c.colors.keyhint.bg = black

# Foreground color of an error message.
c.colors.messages.error.fg = bright_white

# Background color of an error message.
c.colors.messages.error.bg = red

# Border color of an error message.
c.colors.messages.error.border = red

# Foreground color of a warning message.
c.colors.messages.warning.fg = bright_white

# Background color of a warning message.
c.colors.messages.warning.bg = red

# Border color of a warning message.
c.colors.messages.warning.border = red

# Foreground color of an info message.
c.colors.messages.info.fg = bright_white

# Background color of an info message.
c.colors.messages.info.bg = black

# Border color of an info message.
c.colors.messages.info.border = black

# Foreground color for prompts.
c.colors.prompts.fg = bright_white

# Border used around UI elements in prompts.
c.colors.prompts.border = black

# Background color for prompts.
c.colors.prompts.bg = blue

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = blue

# Foreground color for the selected item in filename prompts.
c.colors.prompts.selected.fg = bright_white

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = bright_white

# Background color of the statusbar.
c.colors.statusbar.normal.bg = blue

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = bright_white

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = red

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = bright_white

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = blue

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = bright_white

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = blue

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = bright_white

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = blue

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = bright_white

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = blue

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = bright_white

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = blue

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = bright_white

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = black

# Background color of the progress bar.
c.colors.statusbar.progress.bg = black

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = bright_white

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = bright_red

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = bright_white

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = bright_white

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = bright_white

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = bright_red

# Background color of the tab bar.
c.colors.tabs.bar.bg = black

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = black

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = blue

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = red

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = bright_white

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = black

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = bright_white

# Background color of unselected even tabs.
c.colors.tabs.even.bg = black

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = black

# Foreground color of pinned unselected even tabs.
c.colors.tabs.pinned.even.fg = black

# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = black

# Foreground color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.fg = black

# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = bright_black

# Foreground color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.fg = bright_white

# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = bright_black

# Foreground color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.fg = bright_white

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = bright_white

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = bright_black

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = bright_white

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = bright_black

# Background color for webpages if unset (or empty to use the theme's
# color).
c.colors.webpage.bg = black
