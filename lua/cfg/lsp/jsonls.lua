local lspconfig = require 'lspconfig'
local store = require 'schemastore'
local cfg = require 'cfg.lsp'

local config = vim.tbl_deep_extend('force', cfg, {
  settings = {
    json = {
      schemas = store.json.schemas(),
      validate = { enable = true },
    },
  },
})

lspconfig['jsonls'].setup(config)
