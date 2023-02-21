local setlocal       = vim.opt_local
setlocal.tabstop     = 4
setlocal.shiftwidth  = 4
setlocal.softtabstop = 4

-- custom user commands based off toggle term functionality
local function pydoc(opts)
  vim.cmd [[new]]
  vim.cmd([[r ! pydoc ]] .. opts.args)
  vim.cmd [[1]]
end

buf_create_cmd(0, "Pydoc", pydoc, { nargs = 1 })
-- todo: write toggle term for ipython
