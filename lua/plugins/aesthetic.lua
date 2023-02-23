return {
  {
    "yashguptaz/calvera-dark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.calvera_borders = true
      vim.cmd.colorscheme [[calvera]]
    end
  },
  {
    "rebelot/kanagawa.nvim",
    "ofirgall/ofirkai.nvim",
    "tanvirtin/monokai.nvim",
    "sainnhe/sonokai",
    "lourenci/github-colors",
    "rose-pine/neovim",
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
    opts = { enable = true },
    event = "BufWinEnter",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "cfg.indent"
    end,
  },
  {
    "anuvyklack/windows.nvim", -- window animation and auto resize
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    config = function()
      vim.opt.winwidth = 10
      vim.opt.winminwidth = 5
      vim.opt.equalalways = false
      require "windows".setup {}
    end,
    enabled = false, -- try again on nightly?
  },
}
