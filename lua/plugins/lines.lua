return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-web-devicons",
    config = function()
      require "cfg.lines"
    end,
    event = "UiEnter",
    enabled = true,
  },
  {
    "rebelot/heirline.nvim",
    event = "UiEnter",
    dependencies = "nvim-web-devicons",
    config = function()
      require "cfg.heirline"
    end,
    enabled = false,
  },
  {
    "utilyre/barbecue.nvim",
    version = "*",
    dependencies = {
      "nvim-web-devicons",
      "SmiteshP/nvim-navic",
    },
    event = "UiEnter",
    opts = { theme = "kanagawa" },
  }
}
