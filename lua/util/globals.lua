-- convenience functions
function _G.has(command)
  return vim.fn.executable(command) == 1
end

function _G.cmd(command)
  return "<CMD>" .. command .. "<CR>"
end

-- user command wrapper functions
function _G.command(name, cmd, opts)
  local options = {}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_create_user_command(name, cmd, options)
end

function _G.bcommand(bufnr, name, cmd, opts)
  local options = {}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_buf_create_user_command(bufnr, name, cmd, options)
end

-- various keymap wrapper functions
local defaults = { silent = true }

function _G.nmap(lhs, rhs, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set("n", lhs, rhs, options)
end

function _G.imap(lhs, rhs, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set("i", lhs, rhs, options)
end

function _G.tmap(lhs, rhs, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set("t", lhs, rhs, options)
end

function _G.vmap(lhs, rhs, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set("v", lhs, rhs, options)
end

function _G.xmap(lhs, rhs, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set("x", lhs, rhs, options)
end

function _G.smap(lhs, rhs, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set("s", lhs, rhs, options)
end

function _G.omap(lhs, rhs, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set("o", lhs, rhs, options)
end


function _G.lmap(lhs, rhs, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set("l", lhs, rhs, options)
end

function _G.cmap(lhs, rhs, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set("c", lhs, rhs, options)
end

function _G.ntmap(lhs, rhs, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set({ "n", "t" }, lhs, rhs, options)
end

function _G.nxmap(lhs, rhs, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set({ "n", "x" }, lhs, rhs, options)
end

function _G.nvomap(lhs, rhs, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set({ "n", "v", "o" }, lhs, rhs, options)
end

function _G.nvtmap(lhs, rhs, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set({ "n", "v", "t" }, lhs, rhs, options)
end

function _G.ismap(lhs, rhs, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set({ "i", "s" }, lhs, rhs, options)
end
