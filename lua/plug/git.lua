local gs = {}

gs.on_attach = function(bufnr)
  local gs = package.loaded.gitsigns
  local opts = { buffer = bufnr }

  nmap(']h', gs.next_hunk, opts)
  nmap('[h', gs.prev_hunk, opts)
  nmap('<leader>gph', gs.preview_hunk, opts)

  nvmap('<leader>gsh', cmd 'Gitsigns stage_hunk', opts)
  nvmap('<leader>grh', cmd 'Gitsigns reset_hunk', opts)

  oxmap('ih', cmd '<C-U>Gitsigns select_hunk', opts)
end

gs.signs = {
  add = { text = '+' },
  change = { text = '~' },
  delete = { text = '_' },
  topdelete = { text = '‾' },
  changedelete = { text = '~' },
  untracked = { text = '┆' },
}

gs.preview_config = { border = { 'double' } }

return {
  'tpope/vim-fugitive',
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufWinEnter',
    opts = gs,
  },
}
