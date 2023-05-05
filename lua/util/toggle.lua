local diag = require 'glob.diagnostics'
local M = {}

local function toggle_opt(setting, global)
  if global then
    vim.opt[setting] = not (vim.opt[setting]:get())
  else
    vim.opt_local[setting] = not (vim.opt_local[setting]:get())
  end
end

M.toggle_spell = function()
  toggle_opt('spell', true)
end

M.toggle_loc = function()
  if not diag.is_loc_open() then
    if vim.tbl_isempty(vim.fn.getloclist(0)) then
      diag.update_loc()
    end
    vim.cmd.lopen()
  else
    vim.cmd.lclose()
  end
end

M.toggle_qf = function()
  if not diag.is_qf_open() then
    if vim.tbl_isempty(vim.fn.getqflist()) then
      diag.update_qf()
    end
    vim.cmd.copen()
  else
    vim.cmd.cclose()
  end
end

return M
