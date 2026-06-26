config.load_autoconfig()

c.content.blocking.method = 'both'

c.colors.webpage.darkmode.enabled = True

config.set('content.headers.user_agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36')

c.window.title_format = "{private}{current_title}{title_sep}qutebrowser"
