local clangd = require 'clangd_extensions'
local cfg = require 'cfg.lsp'
local cmp = require 'cmp'

-- add clangd extensions specific key maps?
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("LspConfig", { clear = false }),
--   callback = function(ev)
--     local opts = { buffer = ev.buf }
--   end,
-- })

local function setup_comparator()
  local score = require 'clangd_extensions.cmp_score'
  cmp.setup.buffer { sorting = { comparators = { score } } }
end

vim.api.nvim_create_autocmd('Filetype cpp', {
  group = create_augroup 'ClangdConfig',
  callback = setup_comparator,
})

vim.api.nvim_create_autocmd('Filetype c', {
  group = get_augroup 'ClangdConfig',
  callback = setup_comparator,
})

vim.api.nvim_create_autocmd('Filetype cuda', {
  group = get_augroup 'ClangdConfig',
  callback = setup_comparator,
})

clangd.setup {
  server = vim.tbl_deep_extend('force', cfg, {
    cmd = {
      'clangd',
      '--clang-tidy',
      '--background-index',
      '--all-scopes-completion',
      '--completion-style=detailed',
      '--function-arg-placeholders',
      '--header-insertion=iwyu',
      '--header-insertion-decorators',
    },
  }),
}
