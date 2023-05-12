local set = vim.opt

-- display
set.title = true
set.showcmd = true
set.wildmenu = true
set.ruler = true
set.number = true
set.relativenumber = true
set.cursorline = true
set.termguicolors = true

-- statusline
set.laststatus = 3
set.showtabline = 1

-- search
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

-- linebreaks
set.tw = 80
set.linebreak = true
set.breakindent = true

-- indent
set.autoindent = true
set.smartindent = true

-- tab
set.expandtab = true

set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = -1

-- spelling
set.spelllang = 'en_us'
set.spell = true

-- folds
set.foldexpr = 'nvim_treesitter#foldexpr()'
set.foldmethod = 'expr'
set.foldenable = false

-- turn on the visual bell
set.vb = true
-- confirm potentially bad actions
set.confirm = true
-- always open browser in buf
set.browsedir = 'buffer'
-- open diffs with vsplit
set.diffopt = 'vertical'

-- ignore compiled files
set.wildignore = {
  '*.o',
  '*.so',
  '*.pyc',
  '*.class',
  '*.hi',
}

-- configure vim diagnostic module
vim.diagnostic.config {
  virtual_text = false,
  signs = false,
  float = {
    source = 'always',
    border = 'double'
  },
}

-- disable plugin providers
local providers = {
  'node',
  'perl',
  'python3',
  'ruby',
}

for _, p in ipairs(providers) do
  vim.g['loaded_' .. p .. '_provider'] = 0
end

-- integrate system clipboard
set.clipboard:append('unnamedplus')

-- use xclip as system clipboard if installed
if has 'xclip' then
  local xclip = {}

  xclip.name = 'xclip'

  xclip.copy = {
    ['*'] = 'xclip -selection clipboard',
    ['+'] = 'xclip -selection clipboard',
  }

  xclip.paste = {
    ['*'] = 'xclip -selection clipboard -o',
    ['+'] = 'xclip -selection clipboard -o',
  }

  vim.g.clipboard = xclip
end

-- set :grep to use ripgrep if installed
if has 'rg' then
  set.grepprg = 'rg --vimgrep --no-heading'
  set.grepformat = '%f:%l:%c:%m,%f:%l:%m'
end
