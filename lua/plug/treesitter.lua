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
  },
  -- use treesitter and snippet_engine to generate docstrings
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter",
    opts = { snippet_engine = "snippy" },
    cmd = "Neogen",
  },
  -- treesitter semantic functions for generating cpp code
  {
    "Badhi/nvim-treesitter-cpp-tools",
    dependencies = "nvim-treesitter",
    config = true,
  }
}
