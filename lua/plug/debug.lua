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
    ft = "qf",
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
  -- live render workspace and buffer diagnostics in qf / loclist
  {
    "onsails/diaglist.nvim",
    keys = { "<space>dw", "<space>db" },
    init = function()
      require("diaglist").init {}
    end,
    config = function()
      nmap("<space>dw", require("diaglist").open_all_diagnostics)
      nmap("<space>db", require("diaglist").open_buffer_diagnostics)
    end,
  },
}
