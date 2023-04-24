return {
  "uga-rosa/ugaterm.nvim",
  keys = { "<leader>t", "<leader>tn" },
  cmd = { "UgatermOpen", "UgatermNew" },
  config = function()
    -- \t: open the most recent terminal or exec UgatermNew
    ntmap("<leader>t",   cmd "UgatermOpen")
    -- \to: same as \t
    ntmap("<leader>to",  cmd "UgatermOpen")
    -- \tn: create a new terminal buffer
    ntmap("<leader>tn",  cmd "UgatermNew")
    -- \tt: toggle the current terminal buffer
    ntmap("<leader>tt",  cmd "UgatermToggle")
    -- \ts: select a terminal using vim.ui.select()
    ntmap("<leader>ts",  cmd "UgatermSelect")
    -- \td: delete current terminal buffer
    ntmap("<leader>td",  cmd "UgatermDelete")
    -- \trn: rename the current terminal buffer
    ntmap("<leader>trn", cmd "UgatermRename")
  end,
  lazy = true,
  opts = {},
}
