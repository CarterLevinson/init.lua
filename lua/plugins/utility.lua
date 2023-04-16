return {
  -- shell utilities
  "tpope/vim-eunuch",
  "aymericbeaumet/vim-symlink",
  "jghauser/mkdir.nvim",

  -- lua utilities
  "bfredl/nvim-luadev",
  "milisims/nvim-luaref",
  -- see also:
  -- :h lua-guide
  -- :h h luvref

  -- git utilities
  "tpope/vim-fugitive",

  {
    "lewis6991/gitsigns.nvim",
    config = true,
    event = "BufWinEnter"
  },

  -- remote editing utilities
  {
    "miversen33/netman.nvim",
    config = function()
      require("netman")
    end,
    lazy = true,
  },

  -- editing utilities
  "mbbill/undotree",

  {
    "junegunn/vim-easy-align",
    config = function()
      nxmap("ga", "<Plug>(EasyAlign)")
    end
  },

  -- TODO : add lua highlight whitespace function?
  { "lewis6991/spaceless.nvim", config = true },
  { "elihunter173/dirbuf.nvim", config = true },
  { "numToStr/Comment.nvim",    config = true },
  { "chentoast/marks.nvim",     config = true },
  { "tversteeg/registers.nvim", config = true },
  { "kylechui/nvim-surround",   config = true },
  { "notjedi/nvim-rooter.lua",  config = true },
  { "yamatsum/nvim-cursorline", config = true },
}
