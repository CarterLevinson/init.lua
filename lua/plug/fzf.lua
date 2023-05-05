local fzf = { 'ibhagwan/fzf-lua' }

fzf.dependencies = {
  'nvim-tree/nvim-web-devicons',
  { 'junegunn/fzf.vim', enabled = false },
}

fzf.keys = {
  { '<leader>f', cmd 'FzfLua files' },
  { '<leader>g', cmd 'FzfLua live_grep' },
  { '<leader>gw', cmd 'FzfLua grep_cword' },
  { '<leader>gW', cmd 'FzfLua grep_cWORD' },
  { '<leader>gr', cmd 'FzfLua live_grep_resume' },
  { '<leader>b', cmd 'FzfLua buffers' },
  { '<leader>fo', cmd 'FzfLua oldfiles' },
  { '<leader>fq', cmd 'FzfLua quickfix' },
  { '<leader>fl', cmd 'FzfLua loclist' },
  { '<leader>fg', cmd 'FzfLua git_files' },
  { '<leader>fgc', cmd 'FzfLua git_commits' },
  { '<leader>fgb', cmd 'FzfLua git_branches' },
  { '<leader>fd', cmd 'FzfLua lsp_definitions' },
  { '<leader>fr', cmd 'FzfLua lsp_references' },
  { '<leader>fs', cmd 'FzfLua lsp_workspace_symbols' },
  { '<leader>fi', cmd 'FzfLua lsp_implementations' },
  { '<leader>fM', cmd 'FzfLua marks' },
  { '<leader>fR', cmd 'FzfLua registers' },
}

fzf.cmd = 'FzfLua'

fzf.opts = {}

fzf.opts.border = 'double'
fzf.opts.winopts = {
  normal = 'NormalFloat',
  border = 'NormalFloat',
  cursorline = 'Normal',
}

fzf.lazy = true

return fzf
