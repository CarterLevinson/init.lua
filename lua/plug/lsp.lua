return {
  {
    "neovim/nvim-lspconfig",
    dependencies = "hrsh7th/cmp-nvim-lsp",
    config = function()
      require("cfg.lsp")
    end,
  },
  -- ui-menu for lsp code actions
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu"
  },
  -- command preview applied to lsp rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    opts = {},
  },
  -- standalone ui widget for lsp progress
  {
    "j-hui/fidget.nvim",
    opts = {}
  },
  -- preview window for go to definition / declaration / references
  {
    "rmagatti/goto-preview",
    event = "LspAttach",
    opts = {},
  },
  -- nicely renders doxygen tags in hover window
  {
    "Fildo7525/pretty_hover",
    event = "LspAttach",
    opts = { border = "double" },
  },
  -- show reference counts above function if lsp supports codelens
  {
    "VidocqH/lsp-lens.nvim",
    event = "LspAttach",
    opts = { ignore_filetype = { "sh", "r" } },
  },
  -- displays LightBulbSign in signcolumn if code action is available
  {
    "kosayoda/nvim-lightbulb",
    event = "LspAttach",
    init = function()
      vim.fn.sign_define("LightBulbSign", { text = '' })
    end,
    opts = { autocmd = { enabled = true } },
  },
}
