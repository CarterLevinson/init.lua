return {
  -- access cppreference
  {
    'gauteh/vim-cppman',
    cond = has 'cppman',
    ft = { 'c', 'cpp', 'cuda' },
  },
  -- clangd lsp extensions
  {
    'p00f/clangd_extensions.nvim',
    cond = has 'clangd',
    dependencies = 'nvim-lspconfig',
    config = function()
      require 'cfg.lsp.clangd'
    end,
    ft = { 'c', 'cpp', 'cuda' },
    -- ft = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
  },
}
