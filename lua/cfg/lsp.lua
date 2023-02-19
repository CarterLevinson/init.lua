local clangd_extensions = require "clangd_extensions"
local haskell_tools = require "haskell-tools"
local rust_tools = require "rust-tools"
local json_schema = require "schemastore"
local lspconfig = require "lspconfig"
local cmp = require "cmp_nvim_lsp"
local neodev = require "neodev"
neodev.setup {}
local goto_preview = require "goto-preview"
goto_preview.setup {}

local lsp = vim.lsp
local api = vim.api

--create nvim-cmp capabilities for lsp client
local defaults = cmp.default_capabilities()

local function list_lsp_ws()
  vim.pretty_print(lsp.buf.list_workspace_folders())
end

local function lsp_format()
  lsp.buf.format { async = true }
end

local function create_lsp_autocmds()
end
-- callback function on lsp buffer attatch
-- define keymaps for LSP buffers
local function callback(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr}
  nmap("gd", lsp.buf.definition, opts) -- go to definition
  nmap("gD", lsp.buf.declaration, opts) -- go to declaration
  nmap("gr", lsp.buf.references, opts) -- list all refs in qf
  nmap("gi", lsp.buf.implementation, opts) -- list imps in qf

  nmap("gpd", goto_preview.goto_preview_definition, opts)
  nmap("gpt", goto_preview.goto_preview_type_definition, opts)
  nmap("gpr", goto_preview.goto_preview_references, opts)
  nmap("gpc", goto_preview.close_all_win, opts)

  nmap("K", lsp.buf.hover, opts)
  nmap("<leader>h", lsp.buf.signature_help, opts)
  nmap("<leader>D", lsp.buf.type_definition, opts)
  nmap("<leader>rn", lsp.buf.rename, opts)
  nmap("<leader>ca", cmd "CodeActionMenu", opts)

  nmap("<leader>wa", lsp.buf.add_workspace_folder, opts)
  nmap("<leader>wr", lsp.buf.remove_workspace_folder, opts)

  nmap("<leader>cl", lsp.codelens.run, opts)

  api.nvim_buf_create_user_command(bufnr, "ListWS", list_lsp_ws, {})
  api.nvim_buf_create_user_command(bufnr, "Format", lsp_format, {})
  create_lsp_autocmds()
end

-- disable diagnostic inline virtual text and sign column, keep underline
-- use trouble as interface to diagnostics
vim.diagnostic.config { virtual_text = false, signs = false }

local default_conf = {
  on_attach = callback,
  settings = {
    capabilities = defaults,
    telemetry = { enable = false },
  },
  single_file_support = true,
}

local lua_conf = {
  settings = {
    Lua = {
      completion = { callSnippet = "Replace" },
    }
  }
}

local hls_conf = {
  on_attatch = function(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    callback(_, bufnr)
    nmap('<leader>hs', haskell_tools.hoogle.hoogle_signature, opts )
    nmap('<leader>ea', haskell_tools.lsp.buf_eval_all, opts)
  end,
  settings = {
    haskell = {
      hlintOn = true,
      checkProject = true,
      formattingProvider = "stylish-haskell",
    }
  }
}

local json_conf = {
  settings = {
    json = {
      schemas = json_schema.json.schemas(),
      validate = { enable = true},
    }
  }
}

local clangd_conf = {
  cmd = {
    "clangd",
    "--clang-tidy",
    "--background-index",
    "--all-scopes-completion",
    "--completion-style=detailed",
    "--function-arg-placeholders",
  },
}

local servers = {
  awk_ls = {},
  bashls = {},
  cmake = {},
  cssls = {},
  html = {},
  jsonls = json_conf,
  pyright = {},
  r_language_server = {},
  lua_ls = lua_conf,
  texlab = {}
}

-- setup lsp servers
for lsp, opts in pairs(servers) do
  local options = default_conf
  if not (next(opts) == nil) then
    options = vim.tbl_deep_extend("force", options, opts)
  end
  lspconfig[lsp].setup(options)
end

-- set up clangd lsp extensions
clangd_extensions.setup {
  server = vim.tbl_deep_extend("force", default_conf, clangd_conf)
}

-- setup rust lsp extensions
rust_tools.setup {
  server = default_conf
}

-- setup haskell tools
haskell_tools.setup {
  hls = vim.tbl_deep_extend("force", default_conf, hls_conf),
  tools = { repl = { handler = "toggleterm" } },
}
