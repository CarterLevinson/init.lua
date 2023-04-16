return {
  {
    "folke/trouble.nvim", -- pretty diagnostic interface
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
      -- \x:  toggle the trouble window
      { "<leader>x",  cmd "TroubleToggle" },
      -- \xt: toggle the trouble window
      { "<leader>xt", cmd "TroubleToggle" },
      -- \xw: open trouble with workspace diagnostics
      { "<leader>xw", cmd "Trouble workspace_diagnostics" },
      -- \xd: open trouble with document diagnostics
      { "<leader>xd", cmd "Trouble document_diagnostics" },
      -- \xq: open trouble with the elements of the qf list
      { "<leader>xq", cmd "Trouble quickfix" },
      -- \xl: open trouble with the elements of the loclist
      { "<leader>xl", cmd "Trouble loclist" },
      -- \xr: open trouble with lspr references
      { "<leader>xr", cmd "Trouble lsp_references" },
      -- \xc: close the trouble window
      { "<leader>xc", cmd "TroubleClose" },
      -- also, lsp definitions, lsp implementations,
      -- and lsp type definitions
    },
    config = function()
      require("trouble").setup { auto_close = true }
      vim.cmd [[cnoreabbrev copen  Trouble quickfix]]
      vim.cmd [[cnoreabbrev lopen  Trouble loclist]]
      vim.cmd [[cnoreabbrev cclose TroubleClose]]
      vim.cmd [[cnoreabbrev lclose TroubleClose]]
    end,
  }
}
