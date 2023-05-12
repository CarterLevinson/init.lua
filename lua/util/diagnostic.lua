local M = {}

local function goto_prev(opts)
  local options = { float = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.diagnostic.goto_prev(options)
end

local function goto_next(opts)
  local options = { float = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.diagnostic.goto_next(options)
end

local function open_float(opts)
  local options = {}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.diagnostic.open_float(options)
end

M.open_float = function()
  open_float {}
end

M.goto_next = function()
  goto_next {}
end

M.goto_prev = function()
  goto_prev {}
end

M.goto_next_error = function()
  goto_next { severity = vim.diagnostic.severity.ERROR }
end

M.goto_prev_error = function()
  goto_prev { severity = vim.diagnostic.severity.ERROR }
end

M.goto_next_warning = function()
  goto_next { severity = vim.diagnostic.severity.WARNING }
end

M.goto_prev_warning = function()
  goto_prev { severity = vim.diagnostic.severity.WARNING }
end

return M
