local M = {}

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
  -- get(0, ...) return buffer diagnostics
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
  -- get(nil, ...) return workspace diagnostics
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
