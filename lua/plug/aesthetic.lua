local set = vim.opt

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
    opts = {},
  },
  -- window animation and auto resize
  -- try this again on nightly?
  -- doesn't play nice with vista.vim
  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    init = function()
      set.winwidth    = 10
      set.winminwidth = 5
      set.equalalways = false
    end,
    opts = {},
    enabled = false,
  },
}
