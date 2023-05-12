-- possible to format using lua ls?
local setlocal = vim.opt_local
setlocal.formatprg = 'stylua - '
-- setlocal.isfname   = vim.opt_local.isfname + [[,\.]]
-- setlocal.isfname:append [[,\.]]
