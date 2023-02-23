local setlocal = vim.opt_local
setlocal.tabstop = 4
setlocal.shiftwidth = 4
setlocal.softtabstop = 4

-- haskell file type specifying keybindings / plugins
--
-- \pf: rewrites the line in pointfree style, requires
-- point free binary
nxmap("<leader>pf", "<Plug>Pointfree", { buffer = 0})

-- custom toggle term commands
-- buf_create_cmd(0, "GHCup", function() terms.ghcup:toggle() end)
-- buf_create_cmd(0, "Hdc",   function() terms.hdc:toggle() end)
