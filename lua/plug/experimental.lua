return {
  -- nvim dap user interface and protocol implementation
  {
    'rcarriga/nvim-dap-ui',
    dependencies = 'mfussenegger/nvim-dap',
    config = function()
      require 'cfg.dap'
    end,
    enabled = false,
  },
  -- remote resources
  {
    'miversen33/netman.nvim',
    config = function()
      require 'netman'
    end,
    lazy = true,
    enabled = false,
  },
  -- treesitter semantic functions for generating cpp code
  {
    'Badhi/nvim-treesitter-cpp-tools',
    dependencies = 'nvim-treesitter',
    event = 'BufWinEnter',
    ft = 'cpp',
    opts = {},
    lazy = true,
    enabled = false,
  },
}
