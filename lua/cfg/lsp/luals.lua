local lspconfig = require 'lspconfig'
local neodev = require 'neodev'
local cfg = require 'cfg.lsp'

-- need to setup neodev before calling lspconfig setup on lua_ls
neodev.setup {}

local config = vim.tbl_deep_extend('force', cfg, {
  settings = {
    Lua = {
      completion = { callSnippet = 'Replace' },
      format = { enable = false },
    },
  },
})

lspconfig['lua_ls'].setup(config)
