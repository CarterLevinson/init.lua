local terms = require 'cfg.terminals'
local lspc = require 'cfg.lsp'
local ht = require 'haskell-tools'
local setlocal = vim.opt_local

setlocal.tabstop = 4
setlocal.shiftwidth = 4
setlocal.softtabstop = 4

ht.start_or_attach {
  hls = vim.tbl_deep_extend("force", lspc.config, {
    on_attatch = function(_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      nmap('<leader>hs', ht.hoogle.hoogle_signature, opts)
      nmap('<leader>ea', ht.lsp.buf_eval_all, opts)
      lspc.callback(_, bufnr)
    end,
    settings = {
      haskell = {
        hlintOn = true,
        checkProject = true,
        formattingProvider = "stylish-haskell",
      }
    }
  }),
  tools = {
    repl = { handler = "toggleterm" },
    definition = { hoogle_signature_fallback = true },
  },
}

local function bufGhciToggle()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end

-- haskell file type specifying keybindings / plugins
local opts = { buffer = 0 }
-- haskell tools repl commands
nmap("<leader>rr", ht.repl.toggle, opts)
nmap("<leader>rf", bufGhciToggle, opts)
nmap("<leader>rq", ht.repl.quit, opts)
-- \pf: rewrites the line in pointfree style, requires
-- point free binary
nxmap("<leader>pf", "<Plug>Pointfree", opts)

-- custom toggle term commands
buf_create_cmd(0, "GHCup", function() terms.ghcup:toggle() end)
buf_create_cmd(0, "Hdc",   function() terms.hdc:toggle() end)
