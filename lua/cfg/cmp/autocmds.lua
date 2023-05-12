local cmp = require 'cmp'

local function setup_omni()
  local omni = { { name = 'omni' } }
  cmp.setup.buffer { sources = omni }
end

vim.api.nvim_create_autocmd('Filetype tex', {
  group = create_augroup 'CmpConfig',
  callback = setup_omni,
})

vim.api.nvim_create_autocmd('Filetype plaintex', {
  group = get_augroup 'CmpConfig',
  callback = setup_omni,
})
