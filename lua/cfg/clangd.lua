local lspc = require("cfg.lsp")

-- add clangd extensions specific key maps?
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspConfig", { clear = false }),
  callback = function(ev)
    local opts = { buffer = ev.buf }
  end,
})

require("clangd_extensions").setup {
  server = vim.tbl_deep_extend("force", lspc.default, {
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
