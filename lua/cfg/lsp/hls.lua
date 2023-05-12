local htools = require 'haskell-tools'
local cfg = require 'cfg.lsp'

vim.api.nvim_create_autocmd('LspAttach', {
  group = get_augroup 'LspConfig',
  callback = function(ev)
    local opts = { buffer = ev.buf }
    nmap('<space>ea', htools.lsp.buf_eval_all, opts)
    nmap('<space>hs', htools.hoogle.hoogle_signature, opts)
  end,
})

htools.setup {
  hls = vim.tbl_deep_extend('force', cfg, {
    settings = {
      haskell = {
        hlintOn = true,
        checkProject = true,
        formattingProvider = 'stylish-haskell',
      },
    },
  }),
}
