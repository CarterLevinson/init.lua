local lspc = require("cfg.lsp")

require("clangd_extensions").setup {
  server = vim.tbl_deep_extend("force", lspc.config, {
    cmd = {
      "clangd",
      "--clang-tidy",
      "--background-index",
      "--all-scopes-completion",
      "--completion-style=detailed",
      "--suggest-missing-includes",
      "--function-arg-placeholders",
    }
  })
}
