-- use TS and snippet_engine to generate docstrings
return {
  'danymat/neogen',
  dependencies = {
    'nvim-treesitter',
    'nvim-snippy',
  },
  -- keys = {  { '<LEADER>ds', cmd 'Neogen' } },
  cmd = 'Neogen',
  opts = { snippet_engine = 'snippy' },
}
