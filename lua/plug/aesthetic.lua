return {
  -- window scrolling animations
  {
    "karb94/neoscroll.nvim",
    event = "BufWinEnter",
    opts = { easing_function = "sine" },
  },
  -- highlight indentation level
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = { use_treesitter = true },
  },
  -- current colorscheme
  {
    "justinsgithub/oh-my-monokai.nvim",
    lazy = false,
    config = function()
      require("oh-my-monokai").setup {}
      vim.cmd [[colorscheme oh-my-monokai]]
    end,
  },
  -- transparent background highlighting
  {
    "xiyaowong/nvim-transparent",
    event = "BufWinEnter",
    opts = {},
  },
  -- colorizer and color picker
  {
    "uga-rosa/ccc.nvim",
    event = "BufWinEnter",
    opts = { highlighter = { auto_enable = true } },
  }
}
