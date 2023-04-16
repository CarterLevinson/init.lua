return {
  {
    "justinsgithub/oh-my-monokai.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oh-my-monokai").setup {}
      vim.cmd [[colorscheme oh-my-monokai]]
    end,
  },
  {
    "uga-rosa/ccc.nvim", -- colorizer and color picker
    opts = { highlighter = { auto_enable = true } },
    event = "BufWinEnter",
  },
  {
    "karb94/neoscroll.nvim", -- window scrolling animations
    opts = { easing_function = "sine" },
    event = "BufWinEnter",
  },
  {
    "xiyaowong/nvim-transparent", -- provides transparent background hl
    config = true,
    event = "BufWinEnter",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("cfg.indent")
    end,
    enabled = false,
  },
  {
    "anuvyklack/windows.nvim", -- window animation and auto resize
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    init = function()
      vim.opt.winwidth = 10
      vim.opt.winminwidth = 5
      vim.opt.equalalways = false
    end,
    config = true,
    enabled = false, -- try again on nightly?
  },
}
