return {
  {
    "akinsho/toggleterm.nvim", -- better terminal integration
    keys = {
      -- [count] \t: open or toggle terminal indexed at count
      { "<leader>t", },
      -- \tt: send current line to toggleterm
      { "<leader>tt",  cmd "ToggleTermSendCurrentLine" },
      -- \tv: send visual selection to toggleterm
      { "<leader>tv",  cmd "ToggleTermSendVisualSelection" },
      -- \ttv: send visual selection (lines mode) to toggleterm
      { "<leader>ttv", cmd "ToggleTermSendVisualLines" },
      -- \ta: toggle all terminals
      { "<leader>ta",  cmd "ToggleTermToggleAll" },
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
    enabled = false,
  }
}
