-- todo: vista icons / global icons
vim.g.vista_icon_indent = { '╰─➤ ', '├─➤ ' }
vim.g.vista_sidebar_position = "vertical topleft"
vim.g.vista_update_on_text_changed = 1
vim.g.vista_default_executive = "ctags"
vim.g.vista_ctags_cmd = {
  haskell  = "hasktags -x -o - -c",
  lhaskell = "hasktags -x -o - -c",
}
vim.g.vista_executive_for = {
  awk    = "nvim_lsp",
  bash   = "nvim_lsp",
  c      = "nvim_lsp",
  cpp    = "nvim_lsp",
  cmake  = "nvim_lsp",
  css    = "nvim_lsp",
  html   = "nvim_lsp",
  json   = "nvim_lsp",
  lua    = "nvim_lsp",
  python = "nvim_lsp",
  r      = "nvim_lsp",
  tex    = "nvim_lsp",
}
