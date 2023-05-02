return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("cfg.lualine")
    end,
    event = "UiEnter",
    enabled = true,
  },
  { -- TODO: ?
    "rebelot/heirline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("cfg.heirline")
    end,
    event = "UiEnter",
    enabled = false,
  },
  {
    "utilyre/barbecue.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "SmiteshP/nvim-navic",
    },
    event = "UiEnter",
    opts = { theme = "auto" },
  },
}
