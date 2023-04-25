return {
  -- nvim dap user interface and protocol implementation
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("cfg.dap")
    end,
    enabled = false,
	},
  -- linter interface to nvim diagnostics
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("cfg.lint")
    end,
  },
  -- improvements to qf window
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf" ,
    opts = {}
  },
  -- async build cmds linked to vim qf window
  {
    "radenling/vim-dispatch-neovim",
    dependencies = "tpope/vim-dispatch",
    init = function()
      vim.g.dispatch_no_maps = 1
    end,
    cmd = { "Make", "Dispatch", "Start", "Spawn" },
  },
}