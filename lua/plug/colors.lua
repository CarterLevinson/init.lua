return {
  -- main colors
  {
    'nyngwang/nvimgelion',
    config = function()
      vim.cmd.colorscheme [[nvimgelion]]
    end,
    priority = 1000,
  },
  -- add transparent background hl
  'xiyaowong/nvim-transparent',
  -- vim syntax highlighting files
  'Fymyte/mbsync.vim',
  'kovetskiy/sxhkd-vim',
  'kmonad/kmonad-vim',
  'fladson/vim-kitty',
  'jbmorgado/vim-pine-script',
  'neovimhaskell/haskell-vim',
  -- auxiliary colors
  { 'ofirgall/ofirkai.nvim',            lazy = true },
  { 'lourenci/github-colors',           lazy = true },
  { 'kdheepak/monochrome.nvim',         lazy = true },
  { 'justinsgithub/oh-my-monokai.nvim', lazy = true },
}
