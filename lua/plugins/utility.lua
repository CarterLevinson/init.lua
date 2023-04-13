return {
  -- shell utilities
  "tpope/vim-eunuch",
  "aymericbeaumet/vim-symlink",
  "jghauser/mkdir.nvim",

  -- lua utilities
  "milisims/nvim-luaref",
  "bfredl/nvim-luadev",

  -- git utilities
  "tpope/vim-fugitive",

  {
    "lewis6991/gitsigns.nvim",
    config = true,
    event = "BufWinEnter"
  },

  -- editing utilities
  "mbbill/undotree",

  {
    "junegunn/vim-easy-align",
    config = function()
      nxmap("ga", "<Plug>(EasyAlign)")
    end
  },

  {
    "Vonr/align.nvim",
    config = function()
      --todo
    end,
    enabled = false
  },

  {
    "johnfrankmorgan/whitespace.nvim",
    config = function()
      require("cfg.whitespace")
    end,
    enabled = false,
  },

  -- todo : add lua highlight whitespace
  { "lewis6991/spaceless.nvim", config = true },
  { "elihunter173/dirbuf.nvim", config = true },
  { "numToStr/Comment.nvim",    config = true },
  { "chentoast/marks.nvim",     config = true },
  { "tversteeg/registers.nvim", config = true },
  { "kylechui/nvim-surround",   config = true },
  { "notjedi/nvim-rooter.lua",  config = true },
  { "yamatsum/nvim-cursorline", config = true },
}
