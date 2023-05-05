return {
  -- window scrolling animations
  {
    'karb94/neoscroll.nvim',
    event = 'BufWinEnter',
    opts = { easing_function = 'circular' },
  },
  -- transparent background highlighting
  {
    'xiyaowong/nvim-transparent',
    event = 'BufWinEnter',
    opts = {},
  },
  -- highlight indentation level
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufWinEnter',
    opts = { max_indent_increase = 1 },
  },
  -- colorizer and color picker
  {
    'uga-rosa/ccc.nvim',
    event = 'BufWinEnter',
    opts = { highlighter = { auto_enable = true } },
  },
}
