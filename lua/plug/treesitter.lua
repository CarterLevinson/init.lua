return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("cfg.treesitter")
    end,
    build = ":TSUpdate",
    event = "BufWinEnter",
  },
  -- create vim textobjects using treesitter queries
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter",
  },
  -- use treesitter to semantically rename variables
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    dependencies = "nvim-treesitter",
  },
  -- use treesitter to automagically close html tags
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter",
    opts = {}
  },
  -- treesitter semantic functions for generating cpp code
  {
    "Badhi/nvim-treesitter-cpp-tools",
    dependencies = "nvim-treesitter",
    opts = {},
    ft = "cpp",
    lazy = true,
  },
  -- use treesitter and snippet_engine to generate docstrings
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter",
    cmd = "Neogen",
    opts = { snippet_engine = "snippy" },
  },
}
