return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("cfg.treesitter")
    end,
    build = ":TSUpdate",
    event = "BufWinEnter",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter",
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    dependencies = "nvim-treesitter",
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter",
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter",
    opts = { snippet_engine = "snippy" },
    cmd = "Neogen",
  },
  {
    "Badhi/nvim-treesitter-cpp-tools",
    dependencies = "nvim-treesitter",
    config = true,
  }
}
