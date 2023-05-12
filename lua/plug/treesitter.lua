return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require 'cfg.treesitter'
    end,
    build = ':TSUpdate',
    -- event = { 'BufReadPost', 'BufNewFile' },
  },
  -- create vim text objects using TS queries
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = 'nvim-treesitter',
    event = 'VeryLazy',
  },
  -- use TS to semantically rename variables
  {
    'nvim-treesitter/nvim-treesitter-refactor',
    dependencies = 'nvim-treesitter',
    event = 'VeryLazy',
  },
  -- interactively test queries and get TS tree info
  {
    'nvim-treesitter/playground',
    dependencies = 'nvim-treesitter',
    cmd = {
      'TSPlaygroundToggle',
      'TSNodeUnderCursor',
      'TSHighlightCapturesUnderCursor',
    },
  },
}
