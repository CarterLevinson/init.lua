-- setup lua-ls for neovim development
return {
  'folke/neodev.nvim',
  dependencies = 'nvim-lspconfig',
  cond = has 'lua-language-server',
  config = function()
    require 'cfg.lsp.luals'
  end,
  ft = 'lua',
}
