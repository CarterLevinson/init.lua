local setlocal      = vim.opt_local
setlocal.cinoptions = vim.bo.cinoptions .. "L0"

local cppman = format_as_manpage "cppman"
buffer_command(0, "Cppman", cppman, { nargs = 1 })
