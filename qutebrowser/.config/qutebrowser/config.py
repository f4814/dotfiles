##########
# Layout #
#########
c.tabs.position = "top"
c.tabs.show = "always"
c.url.default_page = "~/.config/qutebrowser/default.html"
c.url.start_pages = c.url.default_page

# Hack font
c.fonts.completion.category = 'Hack'
c.fonts.completion.entry = 'Hack'
c.fonts.debug_console = 'Hack'
c.fonts.downloads = 'Hack'
c.fonts.hints = 'Hack'
c.fonts.keyhint = 'Hack'
c.fonts.messages.error = 'Hack'
c.fonts.messages.info = 'Hack'
c.fonts.messages.warning = 'Hack'
c.fonts.monospace = 'Hack'
c.fonts.prompts = 'Hack'
c.fonts.statusbar = 'Hack'
c.fonts.tabs = 'Hack'


###########
# Content #
###########
# Enable JavaScript.
config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

c.url.searchengines = {"DEFAULT":"https://startpage.com/do/dsearch?query={}",
                       "DICT": "https://dictionary.cambridge.org/dictionary/english/{}",
                       "MINECRAFT": "https://minecraft.gamepedia.com/index.php?search={}",
                       "YT": "https://youtube.com/results?search_query={}",
                       "GENTOO": "https://wiki.gentoo.org/index.php?search={}"}

###########
# Privacy #
###########
c.content.cookies.store = False
c.content.headers.custom = {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}


############
# Bindings #
############
config.bind('m', 'spawn --userscript view_in_mpv {url}')
config.bind('M', 'spawn --userscript play_in_mpd {url}')
