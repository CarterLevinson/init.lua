return {
  {
    "radenling/vim-dispatch-neovim", -- async build cmds
    dependencies = "tpope/vim-dispatch",
    init = function()
      vim.g.dispatch_no_maps          = 1
      vim.g.dispatch_no_tmux_start    = 1
      vim.g.dispatch_no_tmux_spawn    = 1
      vim.g.dispatch_no_tmux_make     = 1
      vim.g.dispatch_no_tmux_dispatch = 1
    end,
    cmd = { "Make", "Dispatch", "Start", "Spawn" },
  }
}
