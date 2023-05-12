return {
  {
    'tpope/vim-fugitive',
    cond = has 'git',
  },
  {
    'lewis6991/gitsigns.nvim',
    cond = has 'git',
    event = 'BufWinEnter',
    config = function()
      require 'cfg.gitsigns'
    end
  }
}
