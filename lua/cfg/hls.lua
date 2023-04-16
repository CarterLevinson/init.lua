local lspc = require("cfg.lsp")
local ht   = require("haskell-tools")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspConfig", { clear = false }),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    nmap("<leader>hs", ht.hoogle.hoogle_signature, opts)
    nmap("<leader>ea", ht.lsp.buf_eval_all, opts)
  end,
})

local hls_conf = {
  settings = {
    haskell = {
      hlintOn = true,
      checkProject = true,
      formattingProvider = "stylish-haskell",
    }
  }
}

ht.setup { hls = vim.tbl_deep_extend("force", lspc.default, hls_conf) }
