return {
  -- shell
  "tpope/vim-eunuch",
  "jghauser/mkdir.nvim",

  -- lua
  "milisims/nvim-luaref",
  -- see also :h lua-guide & :h luvref
  "bfredl/nvim-luadev",

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
    enabled = false,
  },

  -- visualize the undo tree
  "mbbill/undotree",

  {
    "junegunn/vim-easy-align",
    config = function()
      nxmap("ga", "<Plug>(EasyAlign)")
    end
  },

  { "elihunter173/dirbuf.nvim", opts = {} },

  -- TODO : add lua highlight whitespace function?
  { "lewis6991/spaceless.nvim", opts = {} },

  { "chentoast/marks.nvim",     opts = {} },
  { "tversteeg/registers.nvim", opts = {} },
  { "numToStr/Comment.nvim",    opts = {} },
  { "kylechui/nvim-surround",   opts = {} },
  { "notjedi/nvim-rooter.lua",  opts = {} },
  { "yamatsum/nvim-cursorline", opts = {} },
}
