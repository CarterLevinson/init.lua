local icons = require 'util.icons'
local signs = icons.diagnostic_signs
return {
  -- linter interface to nvim diagnostics
  {
    'mfussenegger/nvim-lint',
    config = function()
      require 'cfg.lint'
    end,
  },
  -- improvements to qf window
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    opts = {},
  },
  {
    'yorickpeterse/nvim-pqf',
    opts = { signs = signs },
    enabled = false,
  },
  -- async build cmds linked to vim qf window
  {
    'radenling/vim-dispatch-neovim',
    dependencies = 'tpope/vim-dispatch',
    init = function()
      vim.g.dispatch_no_maps = 1
    end,
    cmd = { 'Make', 'Dispatch', 'Start', 'Spawn' },
  },
}
