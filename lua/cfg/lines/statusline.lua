-- setup git branch component using vim-fugitive
local fugitive_branch = {
  'FugitiveHead',
  icon = '',
}

local function gitsigns_status()
  local gs = vim.b.gitsigns_status_dict
  if gs then
    local status = {
      added = gs.added,
      modified = gs.modified,
      removed = gs.removed,
    }
    return status
  end
end

-- setup git diff component for buffer using gitsigns.nvim
local gitsigns_diff = {
  'diff',
  source = gitsigns_status,
}

-- setup filename component
local fname = {
  'filename',
  file_status = true,
  newfile_status = true,
  symbols = {
    modified = '[+]',
    readonly = '[RO]',
    newfile = '[New]',
  },
}

-- setup diagnostics component
local diagnostics = {
  'diagnostics',
  sources = {
    'nvim_lsp',
    'nvim_diagnostic',
    'nvim_workspace_diagnostic',
  },
}

-- display hex value for byte under cursor using vim statusline syntax
-- see :h statusline
local display_byte = [["0x%B"]]

-- setup lualine with specified components
require('lualine').setup({
  options = {
    icons_enabled = true,
    component_separators = { left = '╲', right = '╱' },
    section_separators = { left = '', right = '' },
    -- component_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
    theme = 'auto',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { fugitive_branch, gitsigns_diff, diagnostics },
    lualine_c = { fname },
    lualine_x = { 'filetype', 'fileformat', 'encoding' },
    lualine_y = { 'progress', 'filesize', display_byte },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {
    "fugitive",
    "man",
    "quickfix",
  --   "fzf",
  },
})
