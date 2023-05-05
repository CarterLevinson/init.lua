-- use git instead of curl to install treesitter parsers
-- require("nvim-treesitter.install").prefer_git = true

local textobjects = {}

textobjects.select = {
  enable = true,
  keymaps = {
    -- 'f' for function
    ['af'] = '@function.outer',
    ['if'] = '@function.inner',
    -- 'F' for function call
    ['aF'] = '@call.outer',
    ['iF'] = '@call.inner',
    -- 'c' for class
    ['ac'] = '@class.outer',
    ['ic'] = '@class.inner',
    -- 'C' for  conditional or control
    ['aC'] = '@conditional.outer',
    ['iC'] = '@conditional.inner',
    -- 'a' for argument
    ['aa'] = '@parameter.outer',
    ['ia'] = '@parameter.inner',
    -- 'A' for attribute
    ['aA'] = '@attribute.outer',
    ['iA'] = '@attribute.inner',
    -- 'l' for loop
    ['aL'] = '@loop.outer',
    ['iL'] = '@loop.inner',
    -- 'L' (line??) for statement
    ['al'] = '@statement.outer',
    ['il'] = '@statement.inner',
    -- 'tf' for template function
    ['tf'] = '@function.outer.start',
    -- 'tc' for template class
    ['tc'] = '@class.outer.start',
  },
}

textobjects.move = {
  enable = true,
  -- whether to set jumps in the jump list
  set_jumps = true,
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

textobjects.swap = {
  enable = true,
  swap_next = {
    ['<leader>xa'] = '@parameter.inner',
    ['<leader>xs'] = '@statement.inner',
    -- ["<leader>xf"] = "@function.inner",
  },
  swap_previous = {
    ['<leader>xA'] = '@parameter.inner',
    ['<leader>xS'] = '@statement.inner',
    -- ["<leader>xF"] = "@function.inner",
  },
}

local refactor = {}

refactor.smart_rename = {
  enable = true,
  keymaps = { smart_rename = 'grr' },
}

refactor.navigation = {
  enable = true,
  keymaps = {
    list_definitions = 'glD',
    list_definition_toc = 'g0',
    goto_next_usage = 'grn',
    goto_prev_usage = 'grp',
    -- goto_next_usage = '<a-j>',
    -- goto_previous_usage = '<a-k>',
  },
}

local enabled = { enable = true }

local opts = {}

-- c, lua, vim, help should always be installed
opts.ensure_installed = 'all'
-- ignore certain TS parsers from all
opts.ignore_install = { 'gleam ' }

opts.auto_install = true
opts.sync_install = false

opts.highlight = enabled

-- experimental = operator support
opts.indent = enabled

opts.textobjects = textobjects
opts.refactor = refactor

opts.incremental_selection = {
  enable = true,
  keymaps = {
    init_selection = '<C-space>',
    node_incremental = '<C-space>',
    node_decremental = '<BS>',
    scope_incremental = false,
    -- init_selection = "gnn",
    -- node_incremental = "grn",
    -- node_decremental = "grm",
    -- scope_incremental = "grc",
  },
}

-- setup TS modules, all modules are disabled by default
require('nvim-treesitter.configs').setup(opts)
