local diagnostic = require 'util.diagnostic'

local function toggle_opt(setting, global)
  if global then
    local set = vim.opt
    set[setting] = not (vim.opt[setting]:get())
  else
    local setlocal = vim.opt_local
    setlocal[setting] = not (vim.opt_local[setting]:get())
  end
end

local M = {}

M.toggle_spell = function()
  toggle_opt('spell', true)
end

M.toggle_window_spell = function()
  toggle_opt('spell', false)
end

M.toggle_loc = function()
  if not diagnostic.is_loc_open() then
    if vim.tbl_isempty(vim.fn.getloclist(0)) then
      diagnostic.update_loc()
    end
    vim.cmd.lopen()
  else
    vim.cmd.lclose()
  end
end

M.toggle_qf = function()
  if not diagnostic.is_qf_open() then
    if vim.tbl_isempty(vim.fn.getqflist()) then
      diagnostic.update_qf()
    end
    vim.cmd.copen()
  else
    vim.cmd.cclose()
  end
end

return M
