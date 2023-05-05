vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  callback = function()
    local lazy = require "lazy"
    local setlocal = vim.opt_local
    lazy.load { plugins = { "nvim-snippy" } }
    setlocal.filetype = "snippets"
  end,
  pattern = '*.snippets',
})
