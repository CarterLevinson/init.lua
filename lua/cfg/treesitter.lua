-- use git instead of curl to install parsers
require("nvim-treesitter.install").prefer_git = true
local incremental_selection = {
  enable = true,
  keymaps = {
    init_selection    = 'gnn',
    node_incremental  = 'grn',
    node_decremental  = 'grm',
    scope_incremental = 'grc',
  },
}

local textobjects = {
  select = {
    enable = true,
    keymaps = {
      -- 'f' for function
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      -- 'F' for function call
      ['aF'] = '@call.outer',
      ['iF'] = '@call.inner',
      -- 'c' for class
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
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
  },
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
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
  },
  swap = {
    enable = true,
    swap_next = {
      ['<leader>a'] = '@parameter.inner',
    },
    swap_previous = {
      ['<leader>A'] = '@parameter.inner',
    },
  },
}

local refactor = {
  smart_rename = {
    enable = true,
    keymaps = {
      smart_rename = 'grr',
    },
    navigation = {
      enable = true,
      keymaps = {
        list_definitions = 'glD',
        list_definition_toc = 'g0',
        goto_next_usage = '<a-j>',
        goto_previous_usage = '<a-k>',
      },
    },
  },
}

local playground = {
  enable = true,
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
  }
}

local query_linter = {
  enable = true,
  use_virtual_text = true,
  line_events = { 'BufWrite', 'CurshorHold' },
}

require("nvim-treesitter.configs").setup {
  -- table of languages to always install
  -- c, lua, vim, help should always be installed
  ensure_installed = "all",
  -- install parsers synchronously (only applies to 'ensure_installed')
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  -- configure TS Highlight module
  highlight = { enable = true },
  -- ts based indenting based on the = operator
  indent = { enable = true },
  -- auto-close html tags
  autotag = { enable = true },
  -- rainbow parens
  rainbow = { enable = true },
  -- incremental selection based on named nodes from the grammar
  incremental_selection = incremental_selection,
  -- configure text objects
  textobjects = textobjects,
  refactor = refactor,
  playground = playground,
  query_linter = query_linter,
}
