-- settings for terminal buffers since we can't use ftplugin
vim.api.nvim_create_autocmd('TermOpen', {
  group = create_augroup 'TerminalStart',
  callback = function()
    local setlocal = vim.opt_local
    setlocal.spell = false
    setlocal.number = false
    setlocal.relativenumber = false
    vim.cmd.startinsert()
  end,
})

-- highlight yanked text for one quarter second
vim.api.nvim_create_autocmd('TextYankPost', {
  group = create_augroup 'YankHighlight',
  callback = function()
    local opts = { higroup = 'IncSearch', timeout = 250 }
    vim.highlight.on_yank(opts)
  end,
  pattern = '*',
})
