local strip_path = function(path)
  return path:match("^.+/(.+)$")
end

local strip_env = function(env)
  return strip_path(os.getenv(env))
end

local g = vim.g

return {
  -- vim syntax highlighting files
  "Fymyte/mbsync.vim",
  "kovetskiy/sxhkd-vim",
  "kmonad/kmonad-vim",
  "jbmorgado/vim-pine-script",
  "fladson/vim-kitty",
  "mboughaba/i3config.vim",

  -- configures lua-ls for neovim development
  {
    "folke/neodev.nvim",
    dependencies = "nvim-lspconfig",
    ft = "lua",
    config = function()
      require("cfg.luals")
    end,
  },

  -- provides json schemas for json ls
  {
    "b0o/schemastore.nvim",
    dependencies = "nvim-lspconfig",
    ft = "json",
    config = function()
      require("cfg.jsonls")
    end,
  },

  -- ftplugin for working with tabular data in vim
  {
    "chrisbra/csv.vim",
    ft = { "csv", "tsv" }
  },

  -- Haskell ftplugins
  {
    "neovimhaskell/haskell-vim",
    ft = { "haskell", "lhaskell" },
    enabled = false,
  },

  {
    "Twinside/vim-hoogle",
    cond = has("hoogle"),
    ft = { "haskell", "lhaskell" }
  },

  {
    "vmchale/pointfree",
    cond = has("pointfree"),
    ft = { "haskell", "lhaskell" },
    config = function()
      -- \pf: rewrites the current line in "pointfree" haskell
      nxmap("<leader>pf", "<Plug>Pointfree", { buffer = 0 })
    end
  },

  {
    "MrcJkb/haskell-tools.nvim", -- haskell lsp extensions
    dependencies = {
      "nvim-lspconfig",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("cfg.hls")
    end,
    ft = { "haskell", "lhaskell", "cabal" },
  },

  -- C family plugins
  {
    "Civitasv/cmake-tools.nvim",
    ft = { "c", "cpp", "cmake" },
    opts = {},
  },

  {
    "p00f/clangd_extensions.nvim", -- clangd lsp extensions
    dependencies = "nvim-lspconfig",
    config = function()
      require("cfg.clangd")
    end,
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  },

  -- Markdown plugins
  {
    "jghauser/follow-md-links.nvim", -- Markdown
    ft = { "markdown", "rmd" }
  },

  {
    "iamcco/markdown-preview.nvim",
    init = function()
      g.mkdp_auto_start = 1
      g.mkdp_auto_close = 1
      g.mkdp_theme = "dark"
      g.mkdp_browser = strip_env("BROWSER")
    end,
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown", "rmd" },
  },

  -- LaTeX ftplugin
  {
    "lervag/vimtex",
    init = function()
      g.vimtex_inded_enabled = 1
      g.vimtex_complete_closed_braces = 1
      g.vimtex_view_method = strip_env("READER")
    end,
  },

  -- ltexls extra features plugin
  {
    "barreiroleo/ltex_extra.nvim",
    ft = { "markdown", "rmd", "tex" },
    dependencies = "nvim-lspconfig",
    config = function()
      require("cfg.ltexls")
    end,
  },
}
