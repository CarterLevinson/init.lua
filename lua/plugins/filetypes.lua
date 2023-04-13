return {
  "Fymyte/mbsync.vim", -- syntax hl plugins
  "kmonad/kmonad-vim",
  "jbmorgado/vim-pine-script",
  "fladson/vim-kitty",
  "mboughaba/i3config.vim",

  {
    "chrisbra/csv.vim", -- tabular data ftplugin
    ft = { "csv", "tsv" }
  },

  {
    "neovimhaskell/haskell-vim", -- Haskell
    ft = { "haskell", "lhaskell" },
    enabled = false,
  },

  {
    "vmchale/pointfree",
    cond = has("pointfree"),
    ft = { "haskell", "lhaskell" },
  },

  {
    "Twinside/vim-hoogle",
    cond = has("hoogle"),
    ft = { "haskell", "lhaskell" }
  },

  {
    "jghauser/follow-md-links.nvim", -- Markdown
    ft = { "markdown", "rmd" }
  },

  {
    "iamcco/markdown-preview.nvim",
    init = function()
      vim.g.mkdp_auto_start = 1
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_theme = "dark"
      vim.g.mkdp_browser = strip_path(os.getenv("BROWSER"))
    end,
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown", "rmd" },
  },

  {
    "lervag/vimtex", -- LaTeX
    init = function()
      vim.g.vimtex_inded_enabled = 1
      vim.g.vimtex_complete_closed_braces = 1
      vim.g.vimtex_view_method = strip_path(os.getenv("READER"))
    end,
  },
}
