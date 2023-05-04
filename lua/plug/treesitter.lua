return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("cfg.treesitter")
    end,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
  },
  -- create vim textobjects using treesitter queries
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter",
    event = "BufWinEnter",
  },
  -- use treesitter to semantically rename variables
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    dependencies = "nvim-treesitter",
    event = "BufWinEnter",
  },
  -- use treesitter to automagically close html tags
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter",
    event = "BufWinEnter",
    ft = "html",
    opts = {}
  },
  -- treesitter semantic functions for generating cpp code
  {
    "Badhi/nvim-treesitter-cpp-tools",
    dependencies = "nvim-treesitter",
    ft = "cpp",
    opts = {},
  },
  -- use treesitter and snippet_engine to generate docstrings
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter",
    cmd = "Neogen",
    opts = { snippet_engine = "snippy" },
  },
}
