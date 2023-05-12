local lint = require 'lint'

lint.linters_by_ft = {
  sh       = { 'shellcheck' },
  cmake    = { 'cmakelint' },
  c        = { 'cppcheck' },
  cpp      = { 'cppcheck' },
  cuda     = { 'cppcheck' },
  haskell  = { 'hlint'},
  lhaskell = { 'hlint' },
  lua      = { 'luacheck' },
  tex      = { 'lacheck', 'chktex' },
  python   = { 'pylint' },
}

local function try_codespell()
  lint.try_lint 'codespell'
end

vim.api.nvim_create_autocmd('InsertLeave', {
  group = create_augroup 'Lint',
  callback = function()
    lint.try_lint()
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  group = get_augroup 'Lint',
  callback = function()
    lint.try_lint()
    try_codespell()
  end,
})

vim.api.nvim_create_autocmd('BufWritePost', {
  group = get_augroup 'Lint',
  callback = function()
    lint.try_lint()
    try_codespell()
  end,
})
