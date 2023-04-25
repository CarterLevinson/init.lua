return {
  -- haskell lsp extensions
  {
    "MrcJkb/haskell-tools.nvim",
    dependencies = {
      "nvim-lspconfig",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("cfg.hls")
    end,
    ft = { "haskell", "lhaskell", "cabal" },
  },
  -- configures lua-ls for neovim development
  {
    "folke/neodev.nvim",
    dependencies = "nvim-lspconfig",
    config = function()
      require("cfg.luals")
    end,
    ft = "lua",
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
  -- ltexls extra features plugin
  {
    "barreiroleo/ltex_extra.nvim",
    dependencies = "nvim-lspconfig",
    config = function()
      require("cfg.ltex")
    end,
    ft = { "markdown", "rmd", "tex", "gitcommit" },
  },
  -- clangd lsp extensions
  {
    "p00f/clangd_extensions.nvim",
    dependencies = "nvim-lspconfig",
    config = function()
      require("cfg.clangd")
    end,
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  },
}
