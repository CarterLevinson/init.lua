return {
  {
    'Twinside/vim-hoogle',
    cond = has 'hoogle',
    ft = { 'haskell', 'lhaskell' },
  },

  {
    'vmchale/pointfree',
    cond = has 'pointfree',
    config = function()
      nxmap('<LEADER>.', '<Plug>Pointfree')
    end,
    ft = { 'haskell', 'lhaskell' },
  },

  {
    'MrcJkb/haskell-tools.nvim',
    cond = has 'haskell-language-server-wrapper',
    dependencies = {
      'nvim-lspconfig',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require 'cfg.lsp.hls'
    end,
    ft = { 'haskell', 'lhaskell', 'cabal' },
  },
}
