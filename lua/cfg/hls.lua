local lspc = require("cfg.lsp")
local ht   = require("haskell-tools")

local hls_conf = {
  on_attach = function(_, bufnr)
    local options = { buffer = bufnr }
    nmap('<leader>hs', ht.hoogle.hoogle_signature, options)
    nmap('<leader>ea', ht.lsp.buf_eval_all, options)
    lspc.callback(_, bufnr)
  end,
  settings = {
    haskell = {
      hlintOn = true,
      checkProject = true,
      -- formattingProvider = "stylish-haskell",
      formattingProvider = "floskell"
    }
  }
}

ht.setup { hls = vim.tbl_deep_extend("force", lspc.config, hls_conf) }
