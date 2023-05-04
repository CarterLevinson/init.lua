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
    opts = {},
    enabled = false,
  },
  {
    "yorickpeterse/nvim-pqf",
    ft = "qf",
    opts = {},
    enabled = false,
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
    config = function()
      nmap("<leader>dw", require("diaglist").open_all_diagnostics)
      nmap("<leader>db", require("diaglist").open_buffer_diagnostics)
    end,
    init = function()
      require("diaglist").init {}
    end,
    keys = { "<leader>dw", "<leader>db" },
    enabled = false,
  },
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>q",  cmd "TroubleToggle" },
      { "<leader>qw", cmd "TroubleToggle workspace_diagnostics" },
      { "<leader>qd", cmd "TroubleToggle document_diagnostics" },
      { "<leader>ql", cmd "TroubleToggle loclist" },
      { "<leader>qq", cmd "TroubleToggle quickfix" },
      { "<leader>qc", cmd "TroubleClose" },
    },
    opts = { autoclose = true },
  },
}
