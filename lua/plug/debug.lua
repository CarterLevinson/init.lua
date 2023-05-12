return {
  -- interface between various linters and vim diagnostics
  {
    'mfussenegger/nvim-lint',
    config = function()
      require 'cfg.lint'
    end,
  },
  -- multiple improvements to qf window
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    opts = {},
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
