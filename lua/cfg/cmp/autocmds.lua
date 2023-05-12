local cmp = require 'cmp'

local function setup_buffer(names)
  local sources = {}
  for _, name in ipairs(names) do
    table.insert(sources, { name = name })
  end
  cmp.setup.buffer { sources = sources }
end

vim.api.nvim_create_autocmd('Filetype text', {
  group = get_augroup 'CmpConfig',
  callback = function()
    setup_buffer { 'spell' }
  end
})

vim.api.nvim_create_autocmd('Filetype tex', {
  group = create_augroup 'CmpConfig',
  callback = function()
    setup_buffer { 'omni', 'spell' }
  end,
})

vim.api.nvim_create_autocmd('Filetype plaintex', {
  group = get_augroup 'CmpConfig',
  callback = function()
    setup_buffer { 'omni', 'spell' }
  end,
})
