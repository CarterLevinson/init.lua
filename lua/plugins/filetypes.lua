local util = require("util.path")

local get_env = function(str)
  return(util.strip_path(os.getenv(str)))
end

return {
  "Fymyte/mbsync.vim", -- syntax hl plugins
  "kovetskiy/sxhkd-vim",
  "kmonad/kmonad-vim",
  "jbmorgado/vim-pine-script",
  "fladson/vim-kitty",
  "mboughaba/i3config.vim",

  {
    "Civitasv/cmake-tools.nvim",
    ft = { "cpp", "cmake" },
    config = true,
  },

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
    config = function()
      -- \pf: rewrites the line in pointfree style
      nxmap("<leader>pf", "<Plug>Pointfree", { buffer = 0})
    end
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
      vim.g.mkdp_browser = get_env("BROWSER")
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
      vim.g.vimtex_view_method = get_env("READER")
    end,
  },
}
