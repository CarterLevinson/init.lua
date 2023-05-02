local diagnostic = vim.diagnostic
-- pseudo auto close for '{' & '}'
imap("{<CR>",          "{<CR>}<ESC>O")

-- follow :h terminal and bring back the escape key
tmap("<ESC>",          "<C-\\><C-n>")

-- tpope inspired mappings w/o heavy plugin
nmap("[b",             cmd "bprev")
nmap("]b",             cmd "bnext")
nmap("[B",             cmd "bfirst")
nmap("]B",             cmd "blast")

nmap("[t",             cmd "tabprev")
nmap("]t",             cmd "tabnext")
nmap("[T",             cmd "tabfirst")
nmap("]T",             cmd "tablast")

nmap("[l",             cmd "lprev")
nmap("]l",             cmd "lnext")
nmap("[L",             cmd "lfirst")
nmap("]L",             cmd "llast")

nmap("[q",             cmd "cprev")
nmap("]q",             cmd "cnext")
nmap("[Q",             cmd "cfirst")
nmap("]Q",             cmd "clast")

-- exchange line with the next / previous line
nmap('[e',             [[:m .+1<CR>==]])
nmap(']e',             [[:m .-2<CR>==]])

nmap("[d",             diagnostic.goto_prev)
nmap("]d",             diagnostic.goto_next)

nmap("<space>e",       diagnostic.open_float)

nmap("<space>w",       cmd "write")
nmap("<space>c",       cmd "close")
nmap("<space><space>", cmd "nohlsearch")

-- insert / remove blank lines, using '[' and ']' as leader
-- how to make these dot repetable?
nmap("[<space>",       [[:set paste<CR>m`O<ESC>``:set nopaste<CR>]])
nmap("]<space>",       [[:set paste<CR>m`o<ESC>``:set nopaste<CR>]])

nmap('[s',             [[m`:silent -g/\m^s*$/d<CR>``:noh<CR>]])
nmap(']s',             [[m`:silent +g/\m^\s*$/d<CR>``:noh<CR>]])

-- turn these into toggle functiosn
nmap("<space>q",       cmd "copen")
nmap("<space>l>",      cmd "lopen")

-- only if not using vim-kitty-navigator
if os.getenv("TERM") ~= "xterm-kitty" then
  ntmap("<C-h>",       cmd "wincmd h")
  ntmap("<C-j>",       cmd "wincmd j")
  ntmap("<C-k>",       cmd "wincmd k")
  ntmap("<C-l>",       cmd "wincmd l")
end
