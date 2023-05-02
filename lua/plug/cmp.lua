return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "dcampos/nvim-snippy", -- snippets engine
    "dcampos/cmp-snippy",
    "hrsh7th/cmp-omni", -- main cmp src plugins
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "amarakon/nvim-cmp-lua-latex-symbols",
    "ray-x/cmp-treesitter",
    { "lukas-reineke/cmp-rg", enabled = false },
    "lukas-reineke/cmp-under-comparator", -- extra cmp comparator
    {
      "petertriho/cmp-git",
      dependencies = "nvim-lua/plenary.nvim",
      opts = {},
    },
  },
  config = function()
    require("cfg.cmp")
  end,
  event = { "InsertEnter", "CmdlineEnter" },
}
