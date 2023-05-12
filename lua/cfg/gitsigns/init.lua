local opts = {}

opts.signs = {
  add = { text = '+' },
  change = { text = '~' },
  delete = { text = '_' },
  topdelete = { text = '‾' },
  changedelete = { text = '~' },
  untracked = { text = '?' },
}

opts.preview_config = {
  border = 'double',
  style = 'minimal',
  relative = 'cursor',
}

opts.on_attach = function(bufnr)
  local gitsigns = package.loaded.gitsigns
  local options = { buffer = bufnr }

  nmap(']h', gitsigns.next_hunk, options)
  nmap('[h', gitsigns.prev_hunk, options)

  nmap('<LEADER>gq', cmd 'Gitsigns setqflist', options)
  nmap('<LEADER>gl', cmd 'Gitsigns setloclist', options)

  nmap('<LEADER>gph', gitsigns.preview_hunk, options)

  nvmap('<LEADER>gsh', cmd 'Gitsigns stage_hunk', options)
  nvmap('<LEADER>grh', cmd 'Gitsigns reset_hunk', options)
end

require('gitsigns').setup(opts)
