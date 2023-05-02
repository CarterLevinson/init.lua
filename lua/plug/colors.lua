return {
  -- main colorscheme
  {
    "nyngwang/nvimgelion",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme [[nvimgelion]]
    end,
  },
  -- auxiliary colorschemes
  { "ofirgall/ofirkai.nvim",             lazy = true },
  { "lourenci/github-colors",            lazy = true },
  { "kdheepak/monochrome.nvim",          lazy = true },
  { "justinsgithub/oh-my-monokai.nvim",  lazy = true },
}
