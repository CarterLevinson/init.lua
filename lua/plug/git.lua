local function callback(bufnr)
  local gs             = package.loaded.gitsigns
  local opts           = { buffer = bufnr }
  nmap("]h",           gs.next_hunk, opts)
  nmap("[h",           gs.prev_hunk, opts)
  nmap("<leader>gph",  gs.preview_hunk, opts)
  nvmap("<leader>gsh", cmd "Gitsigns stage_hunk", opts)
  nvmap("<leader>grh", cmd "Gitsigns reset_hunk", opts)
  oxmap("ih",          cmd "<C-U>Gitsigns select_hunk", opts)
end

return {
  "tpope/vim-fugitive",

  {
    "lewis6991/gitsigns.nvim",
    event = "BufWinEnter",
    opts = { on_attach = callback, preview_config = { border = "double" } },
  },

}
