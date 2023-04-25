local M = {}

local function format_as_manpage(command)
  return function(opts)
    vim.cmd("new")
    vim.cmd("r ! " .. command .. " " .. opts.args)
    vim.cmd("Man!")
    vim.cmd("1")
  end
end

M.format_as_manpage = format_as_manpage

return M
