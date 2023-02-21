function _G.cmd(s)
  return "<CMD>" .. s .. "<CR>"
end

function _G.buf_create_cmd(bufnr, name, cmd, opts)
  local options = {}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_buf_create_user_command(bufnr, name, cmd, options)
end

function _G.create_cmd(name, cmd, opts)
  local options = {}
  if opts then
    options = vim.tble_extend('force', options, opts)
  end
  vim.api.nvim_create_user_command(name, cmd, opts)
end
