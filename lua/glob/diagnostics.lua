local severity = vim.diagnostic.severity
local M = {}

vim.diagnostic.config {
  virtual_text = false,
  -- signs = icons.diagnostic_signs,
  signs = false,
  float = { source = 'always', border = 'double' },
}

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

M.goto_next = function()
  goto_next {}
end

M.goto_prev = function()
  goto_prev {}
end

M.goto_next_error = function()
  goto_next { severity = severity.ERROR }
end

M.goto_prev_error = function()
  goto_prev { severity = severity.ERROR }
end

M.goto_next_warning = function()
  goto_next { severity = severity.WARNING }
end

M.goto_prev_warning = function()
  goto_prev { severity = severity.WARNING }
end

M.is_loc_open = function()
  return vim.fn.get.loclist(0, { winid = 0 }) == 1
end

M.update_loc = function()
  local buf_diagnostics = vim.diagnostic.get(0, {})
  for _, d in ipairs(buf_diagnostics) do
    d.message = d.message .. ' [' .. d.source .. ']'
  end
  local list = vim.diagnostic.toqflist(buf_diagnostics)
  vim.fn.setloclist(0, list, 'r')
end

M.is_qf_open = function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win['quickfix'] == 1 then
      return true
    end
  end
  return false
end

M.update_qf = function()
  local ws_diagnostics = vim.diagnostic.get(nil, {})
  for _, d in ipairs(ws_diagnostics) do
    d.message = d.message .. ' [' .. d.source .. ']'
  end
  local list = vim.diagnostic.toqflist(ws_diagnostics)
  vim.fn.setqflist(list, 'r')
end

return M
