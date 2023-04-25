local diagnostic          = vim.diagnostic
local set                 = vim.opt
local g                   = vim.g

g.loaded_python3_provider = 0
g.loaded_ruby_provider    = 0
g.loaded_perl_provider    = 0
g.loaded_node_provider    = 0

g.loaded_netrw            = 1
g.loaded_netrwPlugin      = 1
g.loaded_netrwSettings    = 1
g.loaded_matchit          = 1

set.confirm               = true
set.vb                    = true

-- display
set.title                 = true
set.showcmd               = true
set.wildmenu              = true
set.ruler                 = true
set.number                = true
set.relativenumber        = true
set.cursorline            = true
set.lazyredraw            = true
set.termguicolors         = true

-- status
set.laststatus            = 3
set.showtabline           = 0

-- line breaks
set.tw                    = 80
set.linebreak             = true
set.breakindent           = true

-- search
set.hlsearch              = true
set.incsearch             = true
set.ignorecase            = true
set.smartcase             = true

-- tabs/indents
set.tabstop               = 2
set.shiftwidth            = 2
set.softtabstop           = -1

set.expandtab             = true

set.autoindent            = true
set.smartindent           = true

-- treesitter folds
set.foldmethod            = "expr"
set.foldexpr              = "nvim_treesitter#foldexpr()"
set.foldenable            = false

set.spelllang             = "en_us"
set.browsedir             = "buffer"
set.diffopt               = "vertical"

-- ignore compiled files
set.wildignore            = {
  "*.o",
  "*.so",
  "*.pyc",
  "*.class",
  "*.hi"
}

-- set custom listchars
set.listchars             = {
  eol                     = "↲",
  tab                     = "»·",
  space                   = "␣",
  trail                   = "·",
  extends                 = "☛",
  precedes                = "☚",
  conceal                 = "┊",
  nbsp                    = "☠",
}

-- set :grep to use ripgrep if installed
if has("rg") then
  set.grepprg    = "rg --vimgrep --no-heading"
  set.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

-- configure nvim diagnostic module
diagnostic.config({ virtual_text = false,  signs = false })
