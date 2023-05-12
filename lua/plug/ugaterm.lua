local function ntkey(lhs, rhs)
  return { lhs, rhs, mode = { 'n', 't' } }
end

return {
  'uga-rosa/ugaterm.nvim',
  keys = {
    ntkey('<LEADER>t',   cmd 'UgatermToggle'), -- \t: toggle the terminal
    ntkey('<LEADER>to',  cmd 'UgatermOpen'),   -- \to: same as \t
    ntkey('<LEADER>tn',  cmd 'UgatermNew'),    -- \tn: create new terminal
    ntkey('<LEADER>tt',  cmd 'UgatermToggle'), -- \tt: toggle terminal
    ntkey('<LEADER>ts',  cmd 'UgatermSelect'), -- \ts: uses vim.ui.select()
    ntkey('<LEADER>td',  cmd 'UgatermDelete'), -- \td: delete terminal
    ntkey('<LEADER>trn', cmd 'UgatermRename'), -- \trn: rename terminal
  },
  cmd = { 'UgatermOpen', 'UgatermNew', 'UgatermToggle' },
  lazy = true,
}
