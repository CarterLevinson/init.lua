return {
  -- window scrolling animations
  {
    'karb94/neoscroll.nvim',
    keys = {
      '<C-f>', '<C-b>',
      '<C-d>', '<C-u>'
    },
    opts = { easing_function = 'sine' },
  },
  -- wrapper for vim.ui.select() and vim.ui.input()
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'rcarriga/nvim-notify',
    event = 'VeryLazy',
    opts = {},
  },
  -- highlight indentation level
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    opts = { max_indent_increase = 1 },
  },
  -- colorizer and color picker
  {
    'uga-rosa/ccc.nvim',
    event = 'VeryLazy',
    opts = { highlighter = { auto_enable = true } },
  },
}
