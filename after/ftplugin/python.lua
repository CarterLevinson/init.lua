local setlocal       = vim.opt_local
setlocal.tabstop     = 4
setlocal.shiftwidth  = 4
setlocal.softtabstop = 4

local format_as_manpage = require("util.format").format_as_manpage
bcommand(0, "Pydoc",  format_as_manpage "pydoc" , { nargs = 1 })
