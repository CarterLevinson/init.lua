return {
  -- shell
  'tpope/vim-eunuch',
  'jghauser/mkdir.nvim',

  -- lua
  'milisims/nvim-luaref',
  -- see also :h lua-guide & :h luvref
  'bfredl/nvim-luadev',

  -- editing
  -- visualize the undo tree
  'mbbill/undotree',

  {
    'junegunn/vim-easy-align',
    config = function()
      nxmap('ga', '<Plug>(EasyAlign)')
    end,
  },

  -- TODO : add lua highlight whitespace function?
  { 'lewis6991/spaceless.nvim', opts = {} },
  { 'elihunter173/dirbuf.nvim', opts = {} },

  { 'chentoast/marks.nvim', opts = {} },
  { 'tversteeg/registers.nvim', opts = {} },

  { 'numToStr/Comment.nvim', opts = {} },
  { 'kylechui/nvim-surround', opts = {} },

  { 'notjedi/nvim-rooter.lua', opts = {} },
  { 'yamatsum/nvim-cursorline', opts = {} },
}
