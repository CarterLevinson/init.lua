local lspconfig = require("lspconfig")
local neodev    = require("neodev")
local json      = require("schemastore")
local cmp       = require("cmp_nvim_lsp")
local gp        = require("goto-preview")
local pretty    = require("pretty_hover")
local lsp       = vim.lsp

-- need to setup neodev before lua_ls
neodev.setup {}
-- setup goto preview plugin
gp.setup {}

local function print_lsp_workspaces()
  vim.pretty_print(lsp.buf.list_workspace_folders())
end

local function lsp_format()
  lsp.buf.format { async = true }
end


-- callback function on lsp buffer attach
-- define keymaps and commands for LSP buffers
local function on_attach(_, bufnr)
  local options = { buffer = bufnr }
  nmap("gd",         lsp.buf.definition, options) -- go to definition
  nmap("gD",         lsp.buf.declaration, options) -- go to declaration
  nmap("gr",         lsp.buf.references, options) -- list all refs in qf
  nmap("gi",         lsp.buf.implementation, options) -- list imps in qf

  nmap("gpd",        gp.goto_preview_definition, options)
  nmap("gpt",        gp.goto_preview_type_definition, options)
  nmap("gpr",        gp.goto_preview_references, options)
  nmap("gpc",        gp.close_all_win, options)

  nmap("K",          pretty.hover, options)
  nmap("<leader>h",  lsp.buf.signature_help, options)
  nmap("<leader>d",  lsp.buf.type_definition, options)

  nmap("<leader>wa", lsp.buf.add_workspace_folder, options)
  nmap("<leader>wr", lsp.buf.remove_workspace_folder, options)

  nmap("<leader>cl", lsp.codelens.run, options)

  nmap("<leader>rn", ":IncRename ", options)
  nmap("<leader>ca", cmd "CodeActionMenu", options)

  bufcommand(bufnr, "ListWS", print_lsp_workspaces)
  bufcommand(bufnr, "Format", lsp_format)
end

local capabilities = lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- default lsp configuration, others can extend from here
local default_conf = {
  on_attach = on_attach,
  settings = {
    --create nvim-cmp capabilities for lsp client
    capabilities = cmp.default_capabilities(capabilities),
    telemetry = { enable = false },
  },
  single_file_support = true,
}

-- json languager server extra configuration
local json_conf = {
  settings = {
    json = {
      -- use schema store plugin for json schemas
      schemas = json.json.schemas(),
      validate = { enable = true },
    }
  }
}

-- lua language server extra configuration
local luals_conf = {
  settings = {
    Lua = {
      completion = { callSnippet = "Replace" },
    }
  }
}

-- ltex language server configurations
local ltex_conf = {
  settings = {
    ltex = {
      language = "en-us"
    }
  }
}

-- list of servers to configure
local lsp_servers = {
  awk_ls = {},
  bashls = {},
  cmake = {},
  cssls = {},
  html = {},
  jsonls = json_conf,
  lua_ls = luals_conf,
  ltex = ltex_conf,
  pyright = {},
  r_language_server = {},
  rust_analyzer = {},
  texlab = {},
}

-- setup each lsp server in list
for server, conf in pairs(lsp_servers) do
  local config = default_conf
  if not (next(conf) == nil) then
    config = vim.tbl_deep_extend("force", config, conf)
  end
  lspconfig[server].setup(config)
end

-- return these core components for lsp extension plugins to build off of
return {
  callback = on_attach,
  config   = default_conf
}
