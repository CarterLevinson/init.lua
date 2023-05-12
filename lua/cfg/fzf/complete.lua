local fzf = require 'fzf-lua'

local completion_modes = {
  'Lines',
  'Keywords (File)',
  'Keywords (Dictionary)',
  'Keywords (Thesaurus)',
  'Keywords (Project)',
  'Tags',
  'File Names',
  'Definitions and Macros',
  'Vim command-line',
  'User Defined Completion',
  'Omni Completion',
  'Spelling Suggestion',
}

local function complete_line()
  fzf.complete_line()
end

local function complete_filename()
  fzf.complete_file {
    cmd = 'rg --files',
    winopts = {
      preview = { hidden = 'nohidden' }
    }
  }
end

-- TO DO generate dictionary and thesarus files
