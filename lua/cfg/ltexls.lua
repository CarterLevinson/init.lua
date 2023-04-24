local lspc = require("cfg.lsp")
local ltex = require("ltex_extra")

ltex.setup {
  server = vim.tbl_deep_extend("force", lspc.default, {
    settings = {
      ltex = {
        language = "en-us",
      }
    }
  })
}
