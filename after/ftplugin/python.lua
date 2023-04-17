local setlocal       = vim.opt_local
setlocal.tabstop     = 4
setlocal.shiftwidth  = 4
setlocal.softtabstop = 4

local util = require("util.format")
bcommand(0, "Pydoc",  util.format_as_manpage("pydoc") , { nargs = 1 })
