return {
  -- navigate between vim and kitty windows
  {
    "knubie/vim-kitty-navigator",
    cond = os.getenv("TERM") == "xterm-kitty",
    init = function()
      vim.g.kitty_navigator_no_mappings = 1
    end,
    config = function()
      ntmap("<C-h>", cmd "KittyNavigateLeft")
      ntmap("<C-j>", cmd "KittyNavigateDown")
      ntmap("<C-k>", cmd "KittyNavigateUp")
      ntmap("<C-l>", cmd "KittyNavigateRight")
    end,
    build = "cp ./*.py ~/.config/kitty/",
  },
  -- run tasks in spawned kitty terminal
  {
    "jghauser/kitty-runner.nvim",
    cond = os.getenv("TERM") == "xterm-kitty",
    opts = { use_keymaps = false },
    enabled = false,
  },
}
