vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  callback = function()
    local lazy = require 'lazy'
    local opts = { plugins = { 'nvim-snippy' } }
    lazy.load(opts)
    local setlocal = vim.opt_local
    setlocal.filetype = 'snippets'
  end,
  pattern = '*.snippets',
})
