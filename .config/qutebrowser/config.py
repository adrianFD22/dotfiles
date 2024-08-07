
# Qutebrowser's config file

# ----------- Modules -----------
import os


# ----------- Functions -----------

# Open multiple tabs with different search engines for searching a term
'''
def multiple_search(search_term, engines_list):
    command = ''

    for curr_engine in engines:
        command += 'open -t ' + curr_engine + ' ' + search_term + ';; '

    return command
'''

# Command for multiple tabs
def command_open_multiple_tabs(*urls):
    command = ''

    for tab in urls:
        command += 'open -t ' + tab + ';;'

    command += 'nop'

    return command

# Open scan shop tabs
def command_open_shop_scan(shops, items):
    urls = []
    command = ''

    for shop in shops:
        for item in items:
            item = item.replace(' ', '+')
            curr_url = shop.format(item)
            urls.append(curr_url)

    return command_open_multiple_tabs(*urls)


# ----------- Bindings -----------

# Navigate tabs
config.unbind('J')
config.unbind('K')

config.bind('<Alt+j>', 'tab-next')
config.bind('<Alt+k>', 'tab-prev')

# Move tabs
config.bind('<Shift+Alt+j>', 'tab-move +')
config.bind('<Shift+Alt+k>', 'tab-move -')

# Back and forward
config.unbind('H')
config.unbind('L')

config.bind('<Alt+h>', 'back')
config.bind('<Alt+l>', 'forward')

# Open and close tabs
config.unbind('d')

config.bind('q', 'tab-close')
config.bind('t', 'open -t')

# Command mode completion
config.unbind('<Tab>', mode='command')
config.unbind('<Shift+Tab>', mode='command')
config.bind('<Alt+j>', 'completion-item-focus next', mode='command')
config.bind('<Alt+k>', 'completion-item-focus prev', mode='command')

# Managing downloads
config.unbind('cd')

config.bind('do', 'download-open;; download-remove')
config.bind('dc', 'download-clear')
config.bind('df', 'spawn --userscript open_downloads_folder.sh')

# Supress banner
config.bind('ek', 'jseval --quiet --file delete_banner.js')

# Play video on mpv
config.bind('pv', 'spawn -u umpv {url}')

# Toggles tabs bar
config.bind('st', 'config-cycle tabs.show never always')
config.set('tabs.show', 'always')

# Toggles devtools
config.bind('<Ctrl+Shift+J>', 'devtools')


# Open scan shop
#shops = [
    #'https://www.amazon.es/s?k={}',
    #'https://link.springer.com/search?query={}'
    #]
#
#items = [
    #'stichtenoth algebraic function fields',
    #'atiyah macdonald commutative algebra'
    #]
#
#config.bind('ss', command_open_shop_scan(shops, items))

# Scientific search
config.bind('ss', 'fake-key <Ctrl-a>;; cmd-later 1 nop;; cmd-later 1 spawn -u ss')

# Pass
#config.bind('pm', 'spawn --userscript qute-pass')

# Select first input text
config.bind('gi', 'hint inputs --first;; cmd-later 3 fake-key <Ctrl-a><Ctrl-x>')

# Select first input text
config.bind('Y', 'fake-key <Ctrl-a><Ctrl-c>')


# ----------- Settings -----------

# Theme
config.source("gruvbox.py")

# Vertical tabs
config.set('tabs.position', 'right')

# Dark mode
config.set("colors.webpage.darkmode.enabled", True)
c.colors.webpage.bg = "#282828"

#c.colors.webpage.preferred_color_scheme         =  'dark'
#c.colors.webpage.darkmode.enabled               =  True
#c.colors.webpage.darkmode.algorithm             =  "lightness-cielab"
#c.colors.webpage.darkmode.threshold.foreground  =  150
#c.colors.webpage.darkmode.threshold.background  =  100
#c.colors.webpage.darkmode.policy.images         =  'smart-simple'
#c.colors.webpage.bg                             = '#282828'

#c.colors.webpage.darkmode.grayscale.images      =  0.35

#config.set('colors.webpage.bg', '#282828') # Avoid qutebrowser white flashes

# Clipboard
config.set('content.javascript.clipboard', 'access', 'github.com')
config.set('content.javascript.clipboard', 'access', 'duckduckgo.com')
config.set('content.javascript.clipboard', 'access', 'ieeexplore.ieee.org')

# File picker
#c.fileselect.handler = "external"
#c.fileselect.multiple_files.command = ["terminal-init", "n -p -"]
#c.fileselect.single_file.command = ["terminal-init", "n -p -"]
#c.fileselect.multiple_files.command = ["st", "-o", "{}", "-e", "nnn", "-p", "-"]
#c.fileselect.single_file.command = ["st", "-o", "{}", "-e", "nnn", "-p", "-"]

# Categories
#config.set('completion.open_categories', [])
config.set('completion.open_categories', ['bookmarks', 'history'])

# Search engines
search_general = {
        "DEFAULT": "https://duckduckgo.com/?q={}",
        "ddg": "https://duckduckgo.com/?q={}",
        "g": "https://www.google.com.ar/search?q={}",
        "wr": "https://www.wordreference.com/es/translation.asp?tranword={}",
        "rd": "https://www.reddit.com/search/?q={}"
        }

search_science = {
        "arxiv": "https://arxiv.org/search/?query={}&searchtype=all&abstracts=show&order=-announced_date_first&size=50",
        "scholar": "https://scholar.google.com/scholar?hl=es&as_sdt=0%2C5&q={}&btnG="
        }

search_engines = {**search_general, **search_science}

config.set('url.searchengines', search_engines)

# Adblock
config.set('content.blocking.method', 'both')
c.content.blocking.adblock.lists = [
        'https://easylist.to/easylist/easylist.txt',
        'https://easylist.to/easylist/easyprivacy.txt',
        'https://easylist-downloads.adblockplus.org/easylistdutch.txt',
        'https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt',
        'https://www.i-dont-care-about-cookies.eu/abp/',
        'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt'
        ]

# TOR
#c.content.proxy = 'socks://localhost:9050/'

# Start and default page
config.set('url.default_page', '~/Personal/Projects/start_page/index.html')
c.url.start_pages = ['~/Personal/Projects/start_page/index.html']

# Show status bar
c.statusbar.show = 'always'

# Autoload
config.load_autoconfig(False)
