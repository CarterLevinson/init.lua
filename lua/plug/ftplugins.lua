return {
  'chrisbra/csv.vim',

  'jghauser/follow-md-links.nvim',

  {
    'iamcco/markdown-preview.nvim',
    init = function()
      local path = require 'util.path'
      vim.g.mkdp_theme = 'dark'
      vim.g.mkdp_browser = path.strip_env 'BROWSER'
    end,
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    -- ft = { 'markdown', 'rmd' },
  },

  {
    'lervag/vimtex',
    init = function()
      local path = require 'util.path'
      -- vim.g.vimtex_complete_closed_braces = 1
      vim.g.vimtex_quickfix_method = 'pplatex'
      vim.g.vimtex_view_method = path.strip_env 'READER'
    end,
  },
}
