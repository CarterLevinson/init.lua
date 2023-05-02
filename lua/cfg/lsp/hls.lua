local lspc   = require("cfg.lsp")
local ht     = require("haskell-tools")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspConfig", { clear = false }),
  callback = function(ev)
    nmap("<space>ea", ht.lsp.buf_eval_all, { buffer = ev.buf})
    nmap("<space>hs", ht.hoogle.hoogle_signature, { buffer = ev.buf})
  end,
})

ht.setup {
  hls = vim.tbl_deep_extend("force", lspc.default, {
    settings = {
      haskell = {
        hlintOn = true,
        checkProject = true,
        formattingProvider = "stylish-haskell",
      }
    }
  })
}
