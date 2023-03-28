function _G.cmd(s)
  return "<CMD>" .. s .. "<CR>"
end

local defaults = {}

function _G.bufcommand(bufnr, name, cmd, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_buf_create_user_command(bufnr, name, cmd, options)
end

function _G.command(name, cmd, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_create_user_command(name, cmd, options)
end
