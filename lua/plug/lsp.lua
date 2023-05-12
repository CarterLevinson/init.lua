return {
  {
    'neovim/nvim-lspconfig',
    dependencies = 'hrsh7th/cmp-nvim-lsp',
    config = function()
      require 'cfg.lsp'
    end,
    -- event = { 'BufReadPost', 'BufNewFile' },
  },
  -- standalone ui widget for lsp progress
  {
    'j-hui/fidget.nvim',
    opts = {},
  },
  -- preview window for go to definition / declaration / references
  {
    'rmagatti/goto-preview',
    event = 'LspAttach',
    opts = {},
  },
  -- show reference counts above function if lsp supports codelens
  {
    'VidocqH/lsp-lens.nvim',
    event = 'LspAttach',
    opts = { ignore_filetype = { 'sh', 'r' } },
  },
  -- ui-menu for lsp code actions
  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
    init = function()
      vim.g.code_action_menu_window_border = 'double'
    end,
  },
  -- displays LightBulbSign in signcolumn if code action is available
  {
    'kosayoda/nvim-lightbulb',
    event = 'LspAttach',
    init = function()
      vim.fn.sign_define('LightBulbSign', { text = '' })
    end,
    opts = { autocmd = { enabled = true } },
  },
}
