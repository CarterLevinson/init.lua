return {
  -- haskell lsp extensions
  {
    "MrcJkb/haskell-tools.nvim",
    dependencies = {
      "nvim-lspconfig",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("cfg.lsp.hls")
    end,
    ft = { "haskell", "lhaskell", "cabal" },
  },
  -- setup lua-ls for neovim development
  {
    "folke/neodev.nvim",
    dependencies = "nvim-lspconfig",
    config = function()
      require("cfg.lsp.luals")
    end,
    ft = "lua",
  },
  -- provides json schemas for json ls
  {
    "b0o/schemastore.nvim",
    dependencies = "nvim-lspconfig",
    config = function()
      require("cfg.lsp.jsonls")
    end,
    ft = "json",
  },
  -- clangd lsp extensions
  {
    "p00f/clangd_extensions.nvim",
    dependencies = "nvim-lspconfig",
    config = function()
      require("cfg.lsp.clangd")
    end,
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  },
}
