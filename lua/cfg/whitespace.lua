local whitespace = require "whitespace-nvim"

whitespace.setup {
  ignored_filetypes = {
    'checkhealth',
    'diff',
    'fugitive',
    'fzf',
    'help',
    'lazy',
    'lspinfo',
    'markdown',
    'quickfix',
    'TelescopePrompt',
    'toggleterm',
    'Trouble',
    'null-ls-info',
  }
}

vim.api.nvim_create_autocmd("BufWritePre", { callback = whitespace.trim })
