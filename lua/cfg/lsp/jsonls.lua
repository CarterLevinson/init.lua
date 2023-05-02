local lspconfig = require("lspconfig")
local lspc      = require("cfg.lsp")
local store     = require("schemastore")

local config = vim.tbl_deep_extend("force", lspc.default, {
  settings = {
    json = {
      schemas = store.json.schemas(),
      validate = { enable = true },
    }
  }
})

lspconfig["jsonls"].setup(config)
