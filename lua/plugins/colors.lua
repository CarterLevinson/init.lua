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
    config = true,
    event = "BufWinEnter",
  },
  -- colorizer and color picker
  {
    "uga-rosa/ccc.nvim",
    opts = { highlighter = { auto_enable = true } },
    event = "BufWinEnter",
  }
}
