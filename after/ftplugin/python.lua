local setlocal       = vim.opt_local
setlocal.tabstop     = 4
setlocal.shiftwidth  = 4
setlocal.softtabstop = 4

local pydoc = format_as_manpage "pydoc"
bufcommand(0, "Pydoc",  pydoc , { nargs = 1 })

-- local ipython        = require "cfg.terminals".ipython
-- local opts = { buffer = 0 }
-- nmap("<leader>rr", function() ipython:toggle() end, opts)
