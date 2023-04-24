local lspconfig = require("lspconfig")
local lspc      = require("cfg.lsp")
local neodev    = require("neodev")

-- need to setup neodev before calling lspconfig setup on lua_ls
neodev.setup {}

local config = vim.tbl_deep_extend("force", lspc.default, {
  settings = {
    Lua = {
      completion = { callSnippet = "Replace" },
    }
  }
})

lspconfig["luals"].setup(config)
