-- necessary require for some reason? might as well use keymaps then
local ts_move = require 'nvim-treesitter.textobjects.repeatable_move'
-- local attach  = require 'nvim-treesitter.textobjects.attach'
local install = require 'nvim-treesitter.install'
local configs = require 'nvim-treesitter.configs'
local opts = {}

install.prefer_git = true

-- make builtin f, F, t, T also repeatable with ; and , (optional)
nxomap('f', ts_move.builtin_f)
nxomap('F', ts_move.builtin_F)
nxomap('t', ts_move.builtin_t)
nxomap('T', ts_move.builtin_T)

-- Repeat movement with ; and ,
-- vim way: ; goes to the direction you were moving.
nxomap(';', ts_move.repeat_last_move)
nxomap(',', ts_move.repeat_last_move_opposite)

-- c, lua, vim, help should always be installed
opts.ensure_installed = 'all'
opts.ignore_install   = { 'gleam' }
opts.auto_install     = false
opts.sync_install     = false

local enabled = { enable = true }

opts.highlight        = enabled
opts.indent           = enabled
opts.query_linter     = enabled

opts.refactor = {}

opts.refactor.smart_rename = {
  enable = true,
  keymaps = { smart_rename = 'grr' },
}

opts.refactor.navigation = {
  enable = true,
  keymaps = {
    list_definitions = 'glD',
    list_definition_toc = 'g0',
    goto_next_usage = 'grn',
    goto_prev_usage = 'grp',
  },
}

opts.textobjects = {}

-- change statement and scopename?
opts.textobjects.select = {
  enable = true,
  lookahead = true,
  keymaps = {
    -- 'a' for argument
    ['aa'] = '@parameter.outer',
    ['ia'] = '@parameter.inner',
    -- 'b' for branch (overwrites)
    ['ab'] = '@conditional.outer',
    ['ib'] = '@conditional.inner',
    -- 'c' for class
    ['ac'] = '@class.outer',
    ['ic'] = '@class.inner',
    -- 'f' for function
    ['af'] = '@function.outer',
    ['if'] = '@function.inner',
    -- 'l' for loop
    ['al'] = '@loop.outer',
    ['il'] = '@loop.inner',
    -- 's' for statement (overwrites)
    ['as'] = '@statement.outer',
    ['is'] = '@statement.inner',
    -- 'A' for assignment
    ['aA'] = '@assignment.outer',
    ['iA'] = '@assignment.inner',
    -- 'B' for block (overwrites)
    ['aB'] = '@block.outer',
    ['iB'] = '@block.inner',
    -- 'C' for function call
    ['aC'] = '@call.outer',
    ['iC'] = '@call.inner',
    -- 'S' for scope
    ['aS'] = '@scopename.outer',
    ['iS'] = '@scopename.inner',
  },
}

opts.textobjects.move = {
  enable = true,
  -- whether to set jumps in the jump list
  set_jumps = true,
  -- add:
  -- comment
  -- block
  -- scope name
  -- attribute
  -- parameter
  goto_next_start = {
    [']m'] = '@function.outer',
    [']]'] = '@class.outer',
  },
  goto_next_end = {
    [']M'] = '@function.outer',
    [']['] = '@class.outer',
  },
  goto_previous_start = {
    ['[m'] = '@function.outer',
    ['[['] = '@class.outer',
  },
  goto_previous_end = {
    ['[M'] = '@function.outer',
    ['[]'] = '@class.outer',
  },
}

opts.textobjects.swap = {
  enable = true,
  -- to add:
  -- block
  -- class
  -- or replace this functionality with external plugin?
  swap_next = {
    ['<leader>xa'] = '@parameter.inner',
    ['<leader>xs'] = '@statement.outer',
    ['<leader>xf'] = '@function.outer',
  },
  swap_previous = {
    ['<leader>xA'] = '@parameter.inner',
    ['<leader>xS'] = '@statement.outer',
    ['<leader>xF'] = '@function.outer',
  },
}

opts.incremental_selection = {
  enable = true,
  keymaps = {
    init_selection = '<C-space>',
    node_incremental = '<C-space>',
    node_decremental = '<BS>',
    scope_incremental = false,
  },
}

opts.playground = {
  enable = true,
  updatetime = 25,
  persist_queries = false,
  keybindings = {
    toggle_query_editor = 'o',
    toggle_hl_groups = 'i',
    toggle_injected_languages = 't',
    toggle_anonymous_nodes = 'a',
    toggle_language_display = 'I',
    focus_language = 'f',
    unfocus_language = 'F',
    update = 'R',
    goto_node = '<cr>',
    show_help = '?',
  },
}

-- setup TS modules, all modules are disabled by default
configs.setup(opts)
