local tt = require "cfg.toggleterms"

local opts = { buffer = 0 }

nmap("<leader>rr", function() tt.radian:toggle() end, opts)
