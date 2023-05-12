-- local setlocal      = vim.opt_local
-- setlocal.cindent    = true
-- setlocal.cinoptions = setlocal.cinoptions + "L0"

local opts = { buffer = 0 }
-- specific TS text object command remaps
vomap('af', cmd 'TSTextobjectSelect @function.outer.start', opts)
vomap('ac', cmd 'TSTextobjectSelect @class.outer.start', opts)
-- redo move as well?
