local ht             = require 'haskell-tools'
local api            = vim.api
local setlocal       = vim.opt_local
setlocal.tabstop     = 4
setlocal.shiftwidth  = 4
setlocal.softtabstop = 4
setlocal.equalprg    = "hindent"

local function replToggleBuf()
  ht.repl.toggle(api.nvim_buf_get_name(0))
end
-- haskell tools repl bindings
nmap("<leader>rr", ht.repl.toggle, { buffer = 0} )
nmap("<leader>rf", replToggleBuf, { buffer = 0 })
nmap("<leader>rq", ht.repl.quit, { buffer = 0 })
-- \pf: rewrites the line in pointfree style, requires
-- point free binary
nxmap("<leader>pf", "<Plug>Pointfree", { buffer = 0 })

api.nvim_buf_create_user_command(0, "HDC",
  function() vim.cmd[[TermEx direction=float go_back=0 cmd="hdc"]] end,
  {}
)
