vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  callback = function()
    local setlocal = vim.opt_local
    setlocal.filetype = "mail"
  end,
  pattern = '*neomutt-*',
})
