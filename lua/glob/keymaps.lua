local diagnostic       = require 'util.diagnostic'
local toggle           = require 'util.toggle'

-- follow :h terminal and bring back the escape key
tmap('<ESC>',          '<C-\\><C-n>')
-- escape key in normal mode erases any highlights first
nmap('<ESC>',          cmd 'nohls'  .. cmd 'match' .. '<ESC>')

-- default for every terminal can override
ntmap('<C-h>',         cmd 'wincmd h')
ntmap('<C-j>',         cmd 'wincmd j')
ntmap('<C-k>',         cmd 'wincmd k')
ntmap('<C-l>',         cmd 'wincmd l')

-- common commands
nmap('<SPACE>w',       cmd 'write')
nmap('<SPACE>c',       cmd 'close')
nmap('<SPACE>x',       cmd 'xall')

-- toggle spellcheck
nmap('<SPACE>ts',      toggle.toggle_spell)

-- lists
nmap('<SPACE>q',       toggle.toggle_qf)
nmap('<SPACE>qo',      cmd 'copen')
nmap('<SPACE>qc',      cmd 'cclose')

nmap('<SPACE>l',       toggle.toggle_loc)
nmap('<SPACE>lo',      cmd 'lopen')
nmap('<SPACE>lc',      cmd 'lclose')

nmap('<SPACE>cc',      cmd 'lclose' .. cmd 'cclose')

-- navigate qf list
nmap('[q',             cmd 'cprev')
nmap(']q',             cmd 'cnext')
nmap('[Q',             cmd 'cfirst')
nmap(']Q',             cmd 'clast')

-- navigate loc list
nmap('[l',             cmd 'lprev')
nmap(']l',             cmd 'lnext')
nmap('[L',             cmd 'lfirst')
nmap(']L',             cmd 'llast')

-- buffers
nmap('<SPACE>b',       cmd 'ls' .. ':b ')
nmap('<SPACE>bd',      cmd 'ls' .. ':bd ')

-- navigate buffer list
nmap('[b',             cmd 'bprev')
nmap(']b',             cmd 'bnext')
nmap('[B',             cmd 'bfirst')
nmap(']B',             cmd 'blast')

-- navigate tab list
nmap('[t',             cmd 'tabprev')
nmap(']t',             cmd 'tabnext')
nmap('[T',             cmd 'tabfirst')
nmap(']T',             cmd 'tablast')

-- diagnostics
nmap('<SPACE>d',       diagnostic.open_float)

-- navigate diagnostic list
nmap('[d',             diagnostic.goto_prev)
nmap(']d',             diagnostic.goto_next)

-- navigate error list
nmap('[e',             diagnostic.goto_prev_error)
nmap(']e',             diagnostic.goto_next_error)

-- navigate warning list
nmap('[w',             diagnostic.goto_prev_warning)
nmap(']w',             diagnostic.goto_next_warning)

-- exchange prev/next line
nmap('[x',             cmd 'm .-2' .. '==')
nmap(']x',             cmd 'm .+1' .. '==')

-- insert / remove blank lines,
local blankline = {}

blankline.insert = {
  above = [[:set paste<CR>m`O<ESC>``:set nopaste<CR>]],
  below = [[:set paste<CR>m`o<ESC>``:set nopaste<CR>]],
}

blankline.delete = {
  above = [[m`:silent -g/\m^s*$/d<CR>``:nohls<CR>]],
  below = [[m`:silent -g/\m^s*$/d<CR>``:nohls<CR>]],
}

-- how to make these dot repeatable?
nmap('<A-j>',          blankline.insert.below)
nmap('<A-k>',          blankline.insert.above)
nmap('<A-J>',          blankline.delete.below)
nmap('<A-K>',          blankline.delete.above)
