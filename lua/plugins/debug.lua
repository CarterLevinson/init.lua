return {
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
    ft = { "qf" },
    config = true,
    enabled = false,
  }
}
