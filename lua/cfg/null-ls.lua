local null_ls      = require "null-ls"

local code_actions = null_ls.builtins.code_actions
local diagnostics  = null_ls.builtins.diagnostics
local formatting   = null_ls.builtins.formatting
local hover        = null_ls.builtins.hover
local completion   = null_ls.builtins.completion

local code_action_gitsigns = code_actions.gitsigns.with {
  config = {
     -- filter out git blame from code actions
    filter_actions = function(title)
      return title:lower():match("blame") == nil
    end,
  }
}

local diagnostics_pylint = diagnostics.pylint.with {
  diagnostics_postprocess = function(diagnostic)
    diagnostic.code = diagnostic.message_id
  end,
}

local diagnostics_luacheck = diagnostics.luacheck.with {
  -- ignore vim directory somehow?
}

local cpp_cppcheck = diagnostics.cppcheck.with {
  filetypes = { "cpp" },
  args = {
    "--enable=warning,style,information",
    "--template=gcc",
    "--language=c++",
    "-j", "6",
  }
}

local c_cppcheck = diagnostics.cppcheck.with {
  filetypes = { "c" },
  args = {
    "--enable=warning,style,information",
    "--template=gcc",
    "--language=c",
    "-j", "6",
  }

}
null_ls.setup {
  sources = {
    -- code actions
    code_actions.shellcheck,
    code_action_gitsigns,
    -- diagnostics
    diagnostics.chktex,
    diagnostics.shellcheck,
    diagnostics.codespell,
    cpp_cppcheck,
    c_cppcheck,
    diagnostics.cpplint,
    -- diagnostics.markdownlint,
    diagnostics.mdl,
    diagnostics.cmake_lint,
    diagnostics_pylint,
    -- formatting
    formatting.isort,
    formatting.black,
    formatting.cabal_fmt,
    -- formatting.clang_format,
    -- formatting.cmake_format,
    formatting.codespell,
    formatting.format_r,
    formatting.jq,
    formatting.latexindent,
    -- formatting.markdownlint,
    -- formatting.stylish_haskell,
    -- formatting.brittany,
    formatting.yapf,
  }
}
