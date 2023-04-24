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
  { "lewis6991/spaceless.nvim", opts = {} },

  { "elihunter173/dirbuf.nvim", opts = {} },
  { "numToStr/Comment.nvim",    opts = {} },
  { "chentoast/marks.nvim",     opts = {} },
  { "tversteeg/registers.nvim", opts = {} },
  { "kylechui/nvim-surround",   opts = {} },
  { "notjedi/nvim-rooter.lua",  opts = {} },
  { "yamatsum/nvim-cursorline", opts = {} },
}
