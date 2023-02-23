return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "cfg.treesitter"
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
    "nvim-treesitter/playground",
    dependencies = "nvim-treesitter",
    cmd = "TSPlaygroundToggle",
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter",
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    dependencies = "nvim-treesitter"
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter",
    opts = { snippet_engine = "snippy" },
    cmd = "Neogen",
  },
}
