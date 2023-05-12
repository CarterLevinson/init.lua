return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'crispgm/nvim-tabline',
    'utilyre/barbecue.nvim',
    'SmiteshP/nvim-navic',
  },
  config = function()
    require 'cfg.lines'
  end,
  event = 'UiEnter',
}
