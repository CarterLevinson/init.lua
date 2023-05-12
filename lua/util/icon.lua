local M = {}

M.lspkind_presets = {
  Text = '󰉿 ',
  Method = '󰆧 ',
  Function = '󰊕 ',
  Constructor = ' ',
  Field = '󰜢 ',
  Variable = '󰀫 ',
  Class = '󰠱 ',
  Interface = ' ',
  Module = ' ',
  Property = '󰜢 ',
  Unit = '󰑭 ',
  Value = '󰎠 ',
  Enum = ' ',
  Keyword = '󰌋 ',
  Snippet = ' ',
  Color = '󰏘 ',
  File = '󰈙 ',
  Reference = '󰈇 ',
  Folder = '󰉋 ',
  EnumMember = ' ',
  Constant = '󰏿 ',
  Struct = '󰙅 ',
  Event = ' ',
  Operator = '󰆕 ',
  TypeParameter = '  ',
}

M.vscode_codicons = {
  Text = ' ',
  Method = ' ',
  Function = ' ',
  Constructor = ' ',
  Field = ' ',
  Variable = ' ',
  Class = ' ',
  Interface = ' ',
  Module = ' ',
  Property = ' ',
  Unit = ' ',
  Value = ' ',
  Enum = ' ',
  Keyword = ' ',
  Snippet = ' ',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = '',
}

M.kinds = {
  Text = ' ',
  Method = ' ',
  Function = ' ',
  Constructor = ' ',
  Field = 'ﰠ ',
  Variable = ' ',
  Class = ' ',
  Interface = 'ﳤ ',
  Module = ' ',
  Property = '襁',
  Unit = '塞',
  Value = '󰎠 ',
  types = ' ',
  Snippet = ' ',
  Color = ' ',
  Enum = '練',
  File = ' ',
  Reference = ' ',
  Folder = ' ',
  EnumMember = 'ﴯ ',
  Constant = ' ',
  Struct = 'פּ ',
  Event = ' ',
  Operator = ' ',
  TypeParameter = ' ',
}

M.extras = {
  Null = ' ',
  String = ' ',
  Number = ' ',
}

M.diagnostics = {
  -- icons / text used for a diagnostic
  error = ' ',
  warning = ' ',
  hint = ' ',
  information = ' ',
  other = ' ',
}

M.extended = function()
  return vim.tbl_extend('keep', M.kinds, M.extras)
end

return M
