-- setup fzf.lua
return {
  'ibhagwan/fzf-lua',
  cond = vim.g.loaded_fzf == 1 or has 'fzf',
  dependencies = 'nvim-tree/nvim-web-devicons',
  keys = {
    { '<LEADER>f',   cmd 'FzfLua files' },
    { '<LEADER>g',   cmd 'FzfLua live_grep' },
    { '<LEADER>gw',  cmd 'FzfLua grep_cword' },
    { '<LEADER>gW',  cmd 'FzfLua grep_cWORD' },
    { '<LEADER>gr',  cmd 'FzfLua live_grep_resume' },
    { '<LEADER>b',   cmd 'FzfLua buffers' },
    { '<LEADER>fo',  cmd 'FzfLua oldfiles' },
    { '<LEADER>fq',  cmd 'FzfLua quickfix' },
    { '<LEADER>fl',  cmd 'FzfLua loclist' },
    { '<LEADER>fg',  cmd 'FzfLua git_files' },
    { '<LEADER>fgc', cmd 'FzfLua git_commits' },
    { '<LEADER>fgb', cmd 'FzfLua git_branches' },
    { '<LEADER>fd',  cmd 'FzfLua lsp_definitions' },
    { '<LEADER>fr',  cmd 'FzfLua lsp_references' },
    { '<LEADER>fs',  cmd 'FzfLua lsp_workspace_symbols' },
    { '<LEADER>fi',  cmd 'FzfLua lsp_implementations' },
    { '<LEADER>fM',  cmd 'FzfLua marks' },
    { '<LEADER>fR',  cmd 'FzfLua registers' },
  },
  cmd = 'FzfLua',
  config = function()
    require 'cfg.fzf'
  end,
  lazy = false,
}
