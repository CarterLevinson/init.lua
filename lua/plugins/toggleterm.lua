return {
  {
    "akinsho/toggleterm.nvim", -- better terminal integration
    keys = {
      { "<leader>t", },
      { "<leader>T",  cmd "ToggleTermSendCurrentLine" },
      { "<leader>tv", cmd "ToggleTermSendVisualSelection" },
      { "<leader>Tv", cmd "ToggleTermSendVisualLines" },
      { "<leader>tt", cmd "ToggleTermToggleAll" },
    },
    opts = {
      open_mapping = "<leader>t",

      terminal_mapping = true,
      persist_mode = true,
      close_on_exit = true,
      shade_terminals = true,

      float_opts = { border = "curved" },
    },
    version = "*",
    lazy = true,
    enabled = true,
  }
}
