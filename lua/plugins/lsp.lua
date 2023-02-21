return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- for default capabilities
      "rmagatti/goto-preview", -- setup in cfg.lsp
      "folke/neodev.nvim",     -- setup in cfg.lsp
      "b0o/SchemaStore.nvim",  -- for jsonls
    },
    config = function()
      require "cfg.lsp"
    end,
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = 'CodeActionMenu'
  },
  {
    "j-hui/fidget.nvim",
    config = true
  },
  {
    "smjonas/inc-rename.nvim",

    cmd = "IncRename",
  },
  {
    "amrbashir/nvim-docs-view",
    config = true,
    cmd = "DocsViewToggle",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = "plenary.nvim",
    config = function()
      require "cfg.null"
    end,
  },
  {
    "MrcJkb/haskell-tools.nvim",
    dependencies = {
      "nvim-lspconfig",
      "toggleterm.nvim",
      "plenary.nvim",
    },
  },
  {
    "p00f/clangd_extensions.nvim",
    dependencies = "nvim-lspconfig",
    config = function()
      require "cfg.clangd"
    end,
    ft = { "c", "cpp", "objc", "objcpp", "cuda" },
  },
  {
    "kosayoda/nvim-lightbulb",
    dependencies = "antoinemadec/FixCursorHold.nvim",
    config = function()
      require("nvim-lightbulb").setup { autocmd = { enabled = true } }
      vim.fn.sign_define("LightBulbSign", { text = "" })
    end,
    event = 'BufWinEnter'
  },
}
