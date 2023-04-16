local format_as_manpage = function(command)
  return function(opts)
    vim.cmd("new")
    vim.cmd("r ! " .. command .. " " .. opts.args)
    vim.cmd("Man!")
    vim.cmd("1")
  end
end

return {
  format_as_manpage = format_as_manpage
}
