return {
  -- window scrolling animations
  {
    "karb94/neoscroll.nvim",
    opts = { easing_function = "sine" },
    event = "BufWinEnter",
  },
  -- highlight indentation level
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("cfg.indent")
    end,
    enabled = false,
  },
  -- window animation and auto resize
  {
    "anuvyklack/windows.nvim",
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
    -- try this again on nightly?
    -- doesn't play nice with vista.vim
    enabled = false,
  },
}
