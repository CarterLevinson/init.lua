function _G.format_as_manpage(command)
  return function(opts)
    vim.cmd("new")
    vim.cmd("r ! " .. command .. opts.args)
    vim.cmd("1")
  end
end

function _G.has(command)
  return vim.fn.executable(command) == 1
end
