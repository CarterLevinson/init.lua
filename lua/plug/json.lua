-- provides json schemas for json ls
return {
  'b0o/schemastore.nvim',
  dependencies = 'nvim-lspconfig',
  cond = has 'vscode-json-language-server',
  config = function()
    require 'cfg.lsp.jsonls'
  end,
  ft = 'json',
}
