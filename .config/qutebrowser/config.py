
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

config.bind('<Alt+j>', 'tab-prev')
config.bind('<Alt+k>', 'tab-next')


# Open and close tabs
config.unbind('d')

config.bind('q', 'tab-close')
config.bind('t', 'open -t')


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
config.bind('st', 'config-cycle tabs.show never multiple')
config.set('tabs.show', 'multiple')


# Toggles devtools
config.bind('<Ctrl+Shift+J>', 'devtools')


# Open scan shop
shops = [
    'https://www.amazon.es/s?k={}',
    'https://link.springer.com/search?query={}'
    ]

items = [
    'stichtenoth algebraic function fields',
    'atiyah macdonald commutative algebra'
    ]

config.bind('ss', command_open_shop_scan(shops, items))


# Pass
config.bind('pm', 'spawn --userscript qute-pass')


# ----------- Settings -----------

# Theme
config.source("gruvbox.py")


# Dark mode
c.colors.webpage.preferred_color_scheme = 'dark'
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
c.colors.webpage.darkmode.threshold.text = 150
c.colors.webpage.darkmode.threshold.background = 100
c.colors.webpage.darkmode.policy.images = 'always'
c.colors.webpage.darkmode.grayscale.images = 0.35

config.set('colors.webpage.bg', '#282828') # Avoid qutebrowser white flashes


# Clipboard
config.set('content.javascript.clipboard', 'access', 'github.com')
config.set('content.javascript.clipboard', 'access', 'duckduckgo.com')
config.set('content.javascript.clipboard', 'access', 'ieeexplore.ieee.org')


# Categories
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
c.content.proxy = 'socks://localhost:9050/'

# Start and default page
config.set('url.default_page', '~/Personal/Projects/start_page/index.html')
c.url.start_pages = ['~/Personal/Projects/start_page/index.html']


# Show status bar
c.statusbar.show = 'always'


# Autoload
config.load_autoconfig(False)
