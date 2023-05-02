local textobjects = {}

textobjects.select = {
  enable = true,
  keymaps = {
    -- 'f' for function
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    -- 'F' for function call
    ["aF"] = "@call.outer",
    ["iF"] = "@call.inner",
    -- 'c' for class
    ["ac"] = "@class.outer",
    ["ic"] = "@class.inner",
    -- 'C' for  conditional or control
    ["aC"] = "@conditional.outer",
    ["iC"] = "@conditional.inner",
    -- 'a' for argument
    ["aa"] = "@parameter.outer",
    ["ia"] = "@parameter.inner",
    -- 'A' for attribute
    ["aA"] = "@attribute.outer",
    ["iA"] = "@attribute.inner",
    -- 'l' for loop
    ["aL"] = "@loop.outer",
    ["iL"] = "@loop.inner",
    -- 'L' (line??) for statement
    ["al"] = "@statement.outer",
    ["il"] = "@statement.inner",
    -- 'tf' for template function
    ["tf"] = "@function.outer.start",
    -- 'tc' for template class
    ["tc"] = "@class.outer.start",
  },
}

textobjects.move = {
  enable = true,
  set_jumps = true, -- whether to set jumps in the jumplist
  goto_next_start = {
    ["]m"] = "@function.outer",
    ["]]"] = "@class.outer",
  },
  goto_next_end = {
    ["]M"] = "@function.outer",
    ["]["] = "@class.outer",
  },
  goto_previous_start = {
    ["[m"] = "@function.outer",
    ["[["] = "@class.outer",
  },
  goto_previous_end = {
    ["[M"] = "@function.outer",
    ["[]"] = "@class.outer",
  },
}

textobjects.swap = {
  enable = true,
  swap_next = {
    ["<leader>a"] = "@parameter.inner",
  },
  swap_previous = {
    ["<leader>A"] = "@parameter.inner",
  },
}

local refactor = {}

refactor.smart_rename = {
  enable = true,
  keymaps = { smart_rename = "grr" }
}

refactor.navigation = {
  enable = true,
  keymaps = {
    list_definitions = "glD",
    list_definition_toc = "g0",
    goto_next_usage = "<a-j>",
    goto_previous_usage = "<a-k>",
  }
}

local selection = {
  enable = true,
  keymaps = {
    init_selection = "gnn",
    node_incremental = "grn",
    node_decremental = "grm",
    scope_incremental = "grc",
  }
}

local enabled = { enable = true }

-- use git instead of curl to install treesitter parsers
require("nvim-treesitter.install").prefer_git = true

-- setup treesitter modules, all modules are disabled by default
-- and must be enabled below
require("nvim-treesitter.configs").setup {
  -- c, lua, vim, help should always be installed
  ensure_installed = "all",
  -- ignore certain parsers from all
  ignore_install = { "gleam" },
  -- install parsers synchronously (only applies to 'ensure_installed')
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  -- enable TS highlighting
  highlight = enabled,
  -- enable TS indentin with = operator
  indent = enabled,
  -- enable TS syntactical text objects
  textobjects = textobjects,
  -- enable TS based renaming and refactoring
  refactor = refactor,
  -- enable TS Node based selection operations
  incremental_selection = selection,
}
