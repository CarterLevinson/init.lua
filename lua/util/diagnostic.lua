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

M.is_loc_open = function()
  return vim.fn.getloclist(0, { winid = 0 }) == 1
end

M.any_loc_open = function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win['loclist'] == 1 then
      return true
    end
  end
  return false
end

M.is_qf_open = function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win['quickfix'] == 1 then
      return true
    end
  end
  return false
end

M.update_loc = function()
  local buf_diagnostics = vim.diagnostic.get(0, {})
  -- append source information to message
  for _, d in ipairs(buf_diagnostics) do
    d.message = d.message .. ' [' .. d.source .. ']'
  end
  vim.fn.setloclist(0, {}, 'r', {
    title = 'Buffer Diagnostics',
    items = vim.diagnostic.toqflist(buf_diagnostics),
  })
end

M.update_qf = function()
  local ws_diagnostics = vim.diagnostic.get(nil, {})
  -- append source information to message
  for _, d in ipairs(ws_diagnostics) do
    d.message = d.message .. ' [' .. d.source .. ']'
  end
  vim.fn.setqflist({}, 'r', {
    title = 'Workspace Diagnostics',
    items = vim.diagnostic.toqflist(ws_diagnostics),
  })
end

return M
