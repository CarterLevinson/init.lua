-- some convenience functions
function _G.has(command)
  return vim.fn.executable(command) == 1
end

function _G.cmd(command)
  return "<CMD>" .. command .. "<CR>"
end

-- various keymap wrapper functions
local function map(mode, lhs, rhs, opts)
  local options = { silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function _G.nmap(lhs, rhs, opts)
  map("n", lhs, rhs, opts)
end

function _G.imap(lhs, rhs, opts)
  map("i", lhs, rhs, opts)
end

function _G.tmap(lhs, rhs, opts)
  map("t", lhs, rhs, opts)
end

function _G.vmap(lhs, rhs, opts)
  map("v", lhs, rhs, opts)
end

function _G.xmap(lhs, rhs, opts)
  map("x", lhs, rhs, opts)
end

function _G.smap(lhs, rhs, opts)
  map("s", lhs, rhs, opts)
end

function _G.omap(lhs, rhs, opts)
  map("o", lhs, rhs, opts)
end

function _G.lmap(lhs, rhs, opts)
  map("l", lhs, rhs, opts)
end

function _G.cmap(lhs, rhs, opts)
  map("c", lhs, rhs, opts)
end

function _G.oxmap(lhs, rhs, opts)
  map({ "o", "x" }, lhs, rhs, opts)
end

function _G.ntmap(lhs, rhs, opts)
  map({ "n", "t" }, lhs, rhs, opts)
end

function _G.nxmap(lhs, rhs, opts)
  map({ "n", "x" }, lhs, rhs, opts)
end

function _G.nvmap(lhs, rhs, opts)
  map({ "n", "v" }, lhs, rhs, opts)
end

function _G.ismap(lhs, rhs, opts)
  map({ "i", "s" }, lhs, rhs, opts)
end

function _G.nvomap(lhs, rhs, opts)
  map({ "n", "v", "o" }, lhs, rhs, opts)
end

function _G.nvtmap(lhs, rhs, opts)
  map({ "n", "v", "t" }, lhs, rhs, opts)
end
