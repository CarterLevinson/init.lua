local ugaterm = { 'uga-rosa/ugaterm.nvim' }

local function create_ntkey(lhs, rhs)
  return { lhs, rhs, mode = { 'n', 't' } }
end

ugaterm.keys = {
  -- \t: open the most recent terminal or exec UgatermNew
  create_ntkey('<leader>t', cmd 'UgatermOpen'),
  -- \to: same as \t
  create_ntkey('<leader>to', cmd 'UgatermOpen'),
  -- \tn: create a new terminal buffer
  create_ntkey('<leader>tn', cmd 'UgatermNew'),
  -- \tt: toggle the current terminal buffer
  create_ntkey('<leader>tt', cmd 'UgatermToggle'),
  -- \ts: select a terminal using vim.ui.select()
  create_ntkey('<leader>ts', cmd 'UgatermSelect'),
  -- \td: delete current terminal buffer
  create_ntkey('<leader>td', cmd 'UgatermDelete'),
  -- \trn: rename the current terminal buffer
  create_ntkey('<leader>trn', cmd 'UgatermToggle'),
}

ugaterm.cmd = { 'UgatermOpen', 'UgatermNew', 'UgatermToggle' }

ugaterm.lazy = true

ugaterm.opts = {}

return ugaterm
