local M = {}

local function command(lhs, rhs)
  vim.api.nvim_create_user_command(lhs, rhs, {})
end

-- Pastel Rainbow
vim.cmd [[highlight Red    guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight Yellow guifg=#cdcc00 gui=nocombine]]
vim.cmd [[highlight Orange guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight Green  guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight Blue   guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight Indigo guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight Violet guifg=#C678DD gui=nocombine]]

-- hl extra ws in bright red
vim.cmd [[highlight ExtraWhitespace guibg=#ff0000 gui=nocombine]]

-- hl any trailing ws so long as not typing on end of line
M.highlight_trailing_ws_except_typing = function()
  vim.cmd [[match ExtraWhitespace /\s\+\%#\@<!$/]]
end

M.hl_trailing_ws = function()
  vim.cmd [[match ExtraWhitespace /\s\+$/]]
end

M.hl_leading_spaces = function()
  vim.cmd [[match ExtraWhitespace /^\t*\zs \+/]]
end

M.hl_leading_tabs = function()
  vim.cmd [[match ExtraWhitespace /\t*\+/]]
end

command('ShowLeadingTabs',        M.hl_leading_tabs)
command('ShowLeadingSpaces',      M.hl_leading_spaces)
command('ShowTrailingWhitespace', M.hl_trailing_ws)

return M
