return {
  "uga-rosa/ugaterm.nvim",
  keys = {
    -- \t: open the most recent terminal or exec UgatermNew
    { "<leader>t",   cmd "UgatermOpen",   mode = { "n", "t" } },
    -- \to: same as \t
    { "<leader>to",  cmd "UgatermOpen",   mode = { "n", "t" } },
    -- \tn: create a new terminal buffer
    { "<leader>tn",  cmd "UgatermNew",    mode = { "n", "t" } },
    -- \tt: toggle the current terminal buffer
    { "<leader>tt",  cmd "UgatermToggle", mode = { "n", "t" } },
    -- \ts: select a terminal using vim.ui.select()
    { "<leader>ts",  cmd "UgatermSelect", mode = { "n", "t" } },
    -- \td: delete current terminal buffer
    { "<leader>td",  cmd "UgatermDelete", mode = { "n", "t" } },
    -- \tc: same as \td
    { "<leader>tc",  cmd "UgatermDelete", mode = { "n", "t" } },
    -- \trn: rename the current terminal buffer
    { "<leader>trn", cmd "UgatermRename", mode = { "n", "t" } },
  },
  cmd = { "UgatermOpen", "UgatermNew" },
  lazy = true,
  opts = {},
}
