return {
  -- shell
  'tpope/vim-eunuch',
  'jghauser/mkdir.nvim',

  -- lua
  'rafcamlet/nvim-luapad',
  -- see also:
  -- :h lua-guide,
  -- :h luaref &
  -- :h luvref

  -- editing

  -- visualize the undo tree
  {
    'mbbill/undotree',
    config = function()
      nmap('<LEADER>u', cmd 'UndotreeToggle')
    end
  },

  -- move single buffer to center of screen
  {
    'shortcuts/no-neck-pain.nvim',
    config = function()
      nmap('<LEADER>nnp', cmd 'NoNeckPain')
    end
  },

  {
    'junegunn/vim-easy-align',
    config = function()
      nxmap('ga', '<Plug>(EasyAlign)')
    end,
  },

  { 'lewis6991/spaceless.nvim', opts = {} },
  { 'elihunter173/dirbuf.nvim', opts = {} },

  { 'chentoast/marks.nvim', opts = {} },
  { 'tversteeg/registers.nvim', opts = {} },

  { 'numToStr/Comment.nvim', opts = {} },
  { 'kylechui/nvim-surround', opts = {} },

  { 'notjedi/nvim-rooter.lua', opts = {} },
  { 'yamatsum/nvim-cursorline', opts = {} },
}
