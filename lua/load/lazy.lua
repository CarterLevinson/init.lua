local lazyopts = {}

local performance = {}

performance.rtp = {
  -- don't remove elements from rtp
  reset = false,
  -- except for these plugins
  disabled_plugins = {
    'black',
    'meson',
    'matchit',
    'matchparen',
    'netrwPlugin',
    'tohtml',
  }
}

lazyopts.ui = {
  border = 'double'
}

lazyopts.dev = {
  path = '~/git/plugins',
  patterns = {},
}

lazyopts.performance = performance

require('lazy').setup('plug', lazyopts)
