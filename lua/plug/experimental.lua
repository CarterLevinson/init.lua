return {
  -- vs code like cmake tools
  {
    'Civitasv/cmake-tools.nvim',
    cond = has 'cmake',
    ft = 'cmake',
    opts = {},
    enabled = false,
  },
  -- ui replacements
  {
    'gorbit99/codewindow.nvim',
    opts = {
      auto_enable = true,
      max_minimap_height = 40,
      window_border = 'double',
    },
    enabled = false,

  },
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    opts = { popupmenu = { backend = 'nui' } },
    enabled = false,
  },
  -- nvim dap user interface and protocol implementation
  {
    'rcarriga/nvim-dap-ui',
    dependencies = 'mfussenegger/nvim-dap',
    config = function()
      require 'exp.dap'
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
