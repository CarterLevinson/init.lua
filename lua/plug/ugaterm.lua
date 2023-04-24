return {
  "uga-rosa/ugaterm.nvim",
  keys = {
    -- \t: open the most recent terminal or create a new one
    { "<leader>t",   cmd "UgatermOpen" },
    -- \tn: create a new terminal buffer
    { "<leader>tn",  cmd "UgatermNew" },
    -- \tt: toggle the current terminal buffer
    { "<leader>tt",  cmd "UgatermToggle" },
    -- \ts: select a terminal using vim.ui.select()
    { "<leader>ts",  cmd "UgatermSelect" },
    -- \td: delete current terminal buffer
    { "<leader>td",  cmd "UgatermDelete" },
    -- \trn: rename the current terminal buffer
    { "<leader>trn", cmd "UgatermRename" },
  },
  cmd = { "UgatermOpen", "UgatermNew" },
  lazy = true,
  opts = {},
}
