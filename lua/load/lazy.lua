local lazyconfig = {}

lazyconfig.rtp = {
  disabled_plugins = {
    'matchit',
    'matchparen',
    'netrwPlugin',
    'tohtml',
  },
}

lazyconfig.dev = {
  path = '~/git/plugins',
  patterns = {},
}

require('lazy').setup('plug', lazyconfig)
