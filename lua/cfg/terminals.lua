local Terminal = require("toggleterm.terminal").Terminal

local defaults = {
  cmd = cmd,
  close_on_exit = false,
  hidden = true,
  go_back = 0,
}

local function make_terminal(cmd, opts)
  local options = defaults
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  return Terminal:new(options)
end

local function make_float_term(cmd, opts)
  local options = vim.tbl_extend("force", opts, { direction = "float" })
  return make_terminal(cmd, options)
end

local function make_vert_term(cmd, opts)
  local options = vim.tbl_extend("force", opts, { direction = "vertical" })
  return make_terminal(cmd, options)
end

local function make_tabbed_term(cmd, opts)
  local options = vim.tbl_extend("force", opts, { direction = "tabbed" })
  return make_terminal(cmd, options)
end

local utils = {
  set_directory = function(term, dir)
    return vim.tbl_extend("force", term, { dir = dir })
  end,
}

return {
  terminals = {
    htop    = make_float_term("htop"),
    cgdb    = make_float_term("cgdb"),
    calc    = make_float_term("bc"),
    hdc     = make_vert_term("hdc"),
    ghcup   = make_float_term("ghcup tui"),
    ipython = make_terminal("ipython", { size = 40 }),
    radian  = make_terminal("radian", { size = 40 }),
  },
  utilities = utils,
}

