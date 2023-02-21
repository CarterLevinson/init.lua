local tts            = require "cfg.terminals"
local setlocal       = vim.opt_local
setlocal.tabstop     = 4
setlocal.shiftwidth  = 4
setlocal.softtabstop = 4

local pydoc = format_output_as_manpage "pydoc"
buf_create_cmd(0, "Pydoc",  pydoc, { nargs = 1 })
-- todo: finish toggle term for python
local opts = { buffer = 0 }
nmap("<leader>rr", function() tts.ipython:toggle() end, opts)
