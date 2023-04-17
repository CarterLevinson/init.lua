local setlocal      = vim.opt_local
setlocal.cinoptions = vim.bo.cinoptions .. "L0"

local util = require("util.format")
bcommand(0, "Cppman", util.format_as_manpage("cppman"), { nargs = 1 })
