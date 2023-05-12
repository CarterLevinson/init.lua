local function gs_callback(bufnr)
  local gitsigns = package.loaded.gitsigns
  local opts = { buffer = bufnr }

  nmap(']h', gitsigns.next_hunk, opts)
  nmap('[h', gitsigns.prev_hunk, opts)

  nmap('<LEADER>gq', cmd 'Gitsigns setqflist', opts)
  nmap('<LEADER>gl', cmd 'Gitsigns setloclist', opts)

  nmap('<LEADER>gph', gitsigns.preview_hunk, opts)

  nvmap('<LEADER>gsh', cmd 'Gitsigns stage_hunk', opts)
  nvmap('<LEADER>grh', cmd 'Gitsigns reset_hunk', opts)
end

return {
  {
    'tpope/vim-fugitive',
    cond = has 'git',
  },
  {
    'lewis6991/gitsigns.nvim',
    cond = has 'git',
    event = 'BufWinEnter',
    opts = {
      on_attach = gs_callback,
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '?' },
      },
      preview_config = {
        border = 'double',
        style = 'minimal',
        relative = 'cursor',
      },
    },
  }
}
