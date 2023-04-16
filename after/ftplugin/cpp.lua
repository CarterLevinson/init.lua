local setlocal      = vim.opt_local
setlocal.cinoptions = vim.bo.cinoptions .. "L0"

local format_as_manpage = require("util.format").format_as_manpage
bcommand(0, "Cppman", format_as_manpage "cppman", { nargs = 1 })
