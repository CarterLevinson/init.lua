return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- snippets engine
    'nvim-snippy',
    -- completion source plugins
    'dcampos/cmp-snippy',
    'hrsh7th/cmp-omni',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-calc',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'amarakon/nvim-cmp-lua-latex-symbols',
    'f3fora/cmp-spell',
    'lukas-reineke/cmp-rg',
    {
      'buschco/nvim-cmp-ts-tag-close',
      dependencies = 'nvim-treesitter',
      opts = {},
      enabled = true,
    },
    {
      'petertriho/cmp-git',
      dependencies = 'nvim-lua/plenary.nvim',
      opts = {},
    },
    -- extra sort comparator for underscore names
    'lukas-reineke/cmp-under-comparator',
  },
  init = function()
    local set = vim.opt
    set.completeopt = { 'menu', 'menuone', 'noselect' }
  end,
  config = function()
    require 'cfg.cmp'
  end,
  event = { 'InsertEnter', 'CmdlineEnter' },
}
