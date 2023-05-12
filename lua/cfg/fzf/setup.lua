local cfg = require 'cfg.fzf.highlights'
local fzf = require 'fzf-lua'

local function commmand(lhs, rhs)
  vim.api.nvim_create_user_command(lhs, rhs, {})
end

local function input_file()
  local function fzf_find_files(dir)
    fzf.files { cwd = dir }
  end
  vim.ui.input({}, fzf_find_files)
end

local winopts = {}

winopts.border = 'double'

winopts.on_create = function()
  local opts = { buffer = 0 }
  -- move up/down through results
  tmap('<C-j>', '<DOWN>', opts)
  tmap('<C-k>', '<UP>', opts)
  -- move up/down through preview
  tmap('<A-j>', '<S-DOWN>', opts)
  tmap('<A-k>', '<S-UP>', opts)
end

fzf.setup { winopts = winopts }
-- fzf.setup { border = 'double' }
