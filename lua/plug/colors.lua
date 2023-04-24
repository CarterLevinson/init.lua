return {
  -- color scheme
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
