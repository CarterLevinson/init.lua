local kitty = { 'knubie/vim-kitty-navigator' }

kitty.cond = os.getenv 'TERM' == 'xterm-kitty'

kitty.init = function()
  vim.g.kitty_navigator_no_mappings = 1
end

kitty.config = function()
  ntmap('<C-h>', cmd 'KittyNavigateLeft')
  ntmap('<C-j>', cmd 'KittyNavigateDown')
  ntmap('<C-k>', cmd 'KittyNavigateUp')
  ntmap('<C-l>', cmd 'KittyNavigateRight')
end

kitty.build = 'cp ./*.py ~/.config/kitty/'

return kitty
