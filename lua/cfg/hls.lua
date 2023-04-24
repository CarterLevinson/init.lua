local lspc = require("cfg.lsp")
local hls  = require("haskell-tools")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspConfig", { clear = false }),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    nmap("<space>hs", hls.hoogle.hoogle_signature, opts)
    nmap("<space>ea", hls.lsp.buf_eval_all, opts)
  end,
})

hls.setup {
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
