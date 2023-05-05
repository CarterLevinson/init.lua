local path = require 'util.path'

return {
  -- vim syntax highlighting files
  'Fymyte/mbsync.vim',
  'kovetskiy/sxhkd-vim',
  'kmonad/kmonad-vim',
  'jbmorgado/vim-pine-script',
  'fladson/vim-kitty',
  'mboughaba/i3config.vim',
  'neovimhaskell/haskell-vim',

  -- filetype plugins (ftplugin)

  -- work with tablular data (csv, tsv, ...)
  'chrisbra/csv.vim',

  -- Haskell
  {
    'Twinside/vim-hoogle',
    cond = has 'hoogle',
    ft = { 'haskell', 'lhaskell' },
  },
  {
    'vmchale/pointfree',
    cond = has 'pointfree',
    config = function()
      -- \pf: rewrites the current line in "pointfree" haskell
      nxmap('<leader>pf', '<Plug>Pointfree', { buffer = 0 })
    end,
    ft = { 'haskell', 'lhaskell' },
  },

  -- C family
  {
    'gauteh/vim-cppman',
    cond = has 'cppman',
    ft = 'cpp',
  },
  {
    'Civitasv/cmake-tools.nvim',
    ft = 'cmake',
    opts = {},
  },

  -- Markdown plugins
  {
    'jghauser/follow-md-links.nvim', -- Markdown
    ft = { 'markdown', 'rmd' },
  },

  {
    'iamcco/markdown-preview.nvim',
    init = function()
      vim.g.mkdp_auto_start = 1
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_theme = 'dark'
      vim.g.mkdp_browser = path.strip_env 'BROWSER'
    end,
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = { 'markdown', 'rmd' },
  },

  -- LaTeX / TeX
  {
    'lervag/vimtex',
    init = function()
      vim.g.vimtex_complete_closed_braces = 1
      vim.g.vimtex_quickfix_method = 'pplatex'
      vim.g.vimtex_view_method = path.strip_env 'READER'
    end,
  },
}
