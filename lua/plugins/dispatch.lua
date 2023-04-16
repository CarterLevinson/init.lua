return {
  {
    "radenling/vim-dispatch-neovim", -- async build cmds
    dependencies = "tpope/vim-dispatch",
    init = function()
      -- disable default mappings
      vim.g.dispatch_no_maps          = 1
      -- disable tmux strategy
      vim.g.dispatch_no_tmux_start    = 1
      vim.g.dispatch_no_tmux_spawn    = 1
      vim.g.dispatch_no_tmux_make     = 1
      vim.g.dispatch_no_tmux_dispatch = 1
    end,
    cmd = { "Make", "Dispatch", "Start", "Spawn", "Copen" },
    enabled = true,
  }
}
