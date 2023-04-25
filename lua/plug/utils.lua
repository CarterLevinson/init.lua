return {
  -- shell
  "tpope/vim-eunuch",
  "jghauser/mkdir.nvim",

  -- lua
  "milisims/nvim-luaref",
  "bfredl/nvim-luadev",
  -- see also:
  -- :h lua-guide & :h luvref

  -- git
  "tpope/vim-fugitive",

  {
    "lewis6991/gitsigns.nvim",
    event = "BufWinEnter",
    opts = {},
  },

  -- editing
  {
    "miversen33/netman.nvim",
    config = function()
      require("netman")
    end,
    lazy = true,
  },

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
