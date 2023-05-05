local toggle           = require 'util.toggle'
local diag             = require 'glob.diagnostics'
-- follow :h terminal and bring back the escape key
tmap("<ESC>",          "<C-\\><C-n>")

-- vim kitty navigator can over ride if loaded
ntmap("<C-h>",         cmd "wincmd h")
ntmap("<C-j>",         cmd "wincmd j")
ntmap("<C-k>",         cmd "wincmd k")
ntmap("<C-l>",         cmd "wincmd l")

-- quickfix list
nmap("<space>q",       toggle.toggle_qf)
nmap("[q",             cmd "cprev")
nmap("]q",             cmd "cnext")
nmap("[Q",             cmd "cfirst")
nmap("]Q",             cmd "clast")

-- location list
nmap("<space>l",       toggle.toggle_loc)
nmap("[l",             cmd "lprev")
nmap("]l",             cmd "lnext")
nmap("[L",             cmd "lfirst")
nmap("]L",             cmd "llast")

-- buffers
nmap("<space>b",       cmd "ls" .. ":b ")
nmap("[b",             cmd "bprev")
nmap("]b",             cmd "bnext")
nmap("[B",             cmd "bfirst")
nmap("]B",             cmd "blast")

-- tabs
nmap("[t",             cmd "tabprev")
nmap("]t",             cmd "tabnext")
nmap("[T",             cmd "tabfirst")
nmap("]T",             cmd "tablast")

-- diagnostics
nmap("<space>e",       diag.open_float)
nmap("[d",             diag.goto_prev)
nmap("]d",             diag.goto_next)
nmap("[e",             diag.goto_prev_error)
nmap("]e",             diag.goto_next_error)
nmap("[w",             diag.goto_prev_warning)
nmap("]w",             diag.goto_next_warning)

-- exchange previous / next line
nmap(']x',             [[:m .-2<CR>==]])
nmap('[x',             [[:m .+1<CR>==]])

-- toggle spellcheck
nmap("<space>s",       toggle.toggle_spell)

-- common commands
nmap("<space>w",       cmd "write")
nmap("<space>c",       cmd "close")
nmap("<space><space>", cmd "nohlsearch")

-- insert / remove blank lines, how to make these dot repeatable?
nmap("<C-s>j",         [[:set paste<CR>m`o<ESC>``:set nopaste<CR>]])
nmap("<C-s>k",         [[:set paste<CR>m`O<ESC>``:set nopaste<CR>]])
nmap("<A-s>j",         [[m`:silent +g/\m^\s*$/d<CR>``:noh<CR>]])
nmap("<A-s>k",         [[m`:silent -g/\m^s*$/d<CR>``:noh<CR>]])

-- nmap("<space>j",       [[:set paste<CR>m`o<ESC>``:set nopaste<CR>]])
-- nmap("<space>k",       [[:set paste<CR>m`O<ESC>``:set nopaste<CR>]])
-- nmap("<space>J",       [[m`:silent +g/\m^\s*$/d<CR>``:noh<CR>]])
-- nmap("<space>K",       [[m`:silent -g/\m^s*$/d<CR>``:noh<CR>]])

-- redo these auto close things as global snippets?
-- pseudo auto close for '{' & '}'
-- imap("{<CR>",          "{<CR>}<ESC>O")
