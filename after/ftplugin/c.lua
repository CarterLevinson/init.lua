local setlocal   = vim.opt_local
setlocal.cindent = true

vim.api.nvim_create_augroup("Format", { clear = false })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "Format",
  buffer = 0,
  callback = function() vim.lsp.buf.format{ async = true } end,
})
