-- convenience functions
function _G.cmd(command)
  return '<CMD>' .. command .. '<CR>'
end

-- converts result of vim fn to bool
function _G.has(program)
  return vim.fn.executable(program) == 1
end

-- augroup functions
function _G.create_augroup(name)
  local options = { clear = true }
  return vim.api.nvim_create_augroup(name, options)
end

function _G.get_augroup(name)
  local options = { clear = false }
  return vim.api.nvim_create_augroup(name, options)
end

-- keymap functions
local function map(mode, lhs, rhs, opts)
  local options = { silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function _G.nmap(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

function _G.imap(lhs, rhs, opts)
  map('i', lhs, rhs, opts)
end

function _G.tmap(lhs, rhs, opts)
  map('t', lhs, rhs, opts)
end

function _G.vmap(lhs, rhs, opts)
  map('v', lhs, rhs, opts)
end

function _G.xmap(lhs, rhs, opts)
  map('x', lhs, rhs, opts)
end

function _G.smap(lhs, rhs, opts)
  map('s', lhs, rhs, opts)
end

function _G.omap(lhs, rhs, opts)
  map('o', lhs, rhs, opts)
end

function _G.lmap(lhs, rhs, opts)
  map('l', lhs, rhs, opts)
end

function _G.cmap(lhs, rhs, opts)
  map('c', lhs, rhs, opts)
end

function _G.vomap(lhs, rhs, opts)
  map({'v', 'o' }, lhs, rhs, opts)
end

function _G.xomap(lhs, rhs, opts)
  map({ 'o', 'x' }, lhs, rhs, opts)
end

function _G.vxomap(lhs, rhs, opts)
  map({ 'v', 'x', 'o' }, lhs, rhs, opts)
end

function _G.ismap(lhs, rhs, opts)
  map({ 'i', 's' }, lhs, rhs, opts)
end

function _G.ntmap(lhs, rhs, opts)
  map({ 'n', 't' }, lhs, rhs, opts)
end

function _G.nxmap(lhs, rhs, opts)
  map({ 'n', 'x' }, lhs, rhs, opts)
end

function _G.nvmap(lhs, rhs, opts)
  map({ 'n', 'v' }, lhs, rhs, opts)
end

function _G.nvomap(lhs, rhs, opts)
  map({ 'n', 'v', 'o' }, lhs, rhs, opts)
end

function _G.nxomap(lhs, rhs, opts)
  map({ 'n', 'x', 'o' }, lhs, rhs, opts)
end

function _G.nvtmap(lhs, rhs, opts)
  map({ 'n', 'v', 't' }, lhs, rhs, opts)
end

local function unmap(mode, lhs, opts)
  local options = {}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.del(mode, lhs, options)
end
