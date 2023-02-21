local setlocal      = vim.opt_local
setlocal.cinoptions = vim.bo.cinoptions .. "L0"

local cppman = format_output_as_manpage "cppman"
buf_create_cmd(0, "Cppman", cppman, { nargs = 1 })
