local lspconfig = require "lspconfig"
local neodev    = require "neodev"
local json      = require "schemastore"
local cmp       = require "cmp_nvim_lsp"
local gp        = require "goto-preview"
local lsp       = vim.lsp

-- need to setup neodev before lua_ls
neodev.setup {}
-- setup goto preview plugin
gp.setup {}

local function lsp_formatting(bufnr)
  lsp.buf.format {
    filter = function(client)
      -- logic here
      -- in this case always return null-ls
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
    async = true,
  }
end

local function lsp_print_workspaces()
  vim.pretty_print(lsp.buf.list_workspace_folders())
end

local function lsp_basic_formatting()
  lsp.buf.format { async = true }
end


-- callback function on lsp buffer attach
-- define keymaps and commands for LSP buffers
local function on_attach(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  nmap("gd",         lsp.buf.definition, opts) -- go to definition
  nmap("gD",         lsp.buf.declaration, opts) -- go to declaration
  nmap("gr",         lsp.buf.references, opts) -- list all refs in qf
  nmap("gi",         lsp.buf.implementation, opts) -- list imps in qf

  nmap("gpd",        gp.goto_preview_definition, opts)
  nmap("gpt",        gp.goto_preview_type_definition, opts)
  nmap("gpr",        gp.goto_preview_references, opts)
  nmap("gpc",        gp.close_all_win, opts)

  nmap("K",          lsp.buf.hover, opts)
  nmap("<leader>h",  lsp.buf.signature_help, opts)
  nmap("<leader>d",  lsp.buf.type_definition, opts)

  nmap("<leader>wa", lsp.buf.add_workspace_folder, opts)
  nmap("<leader>wr", lsp.buf.remove_workspace_folder, opts)

  nmap("<leader>cl", lsp.codelens.run, opts)

  nmap("<leader>rn", ":IncRename ", opts)
  nmap("<leader>ca", cmd "CodeActionMenu", opts)


  buf_create_cmd(bufnr, "ListWS", lsp_print_workspaces)
  buf_create_cmd(bufnr, "Format", lsp_basic_formatting)
end

-- default lsp configuration, others can extend from here
local default_conf = {
  on_attach = on_attach,
  settings = {
    --create nvim-cmp capabilities for lsp client
    capabilities = cmp.default_capabilities(),
    telemetry = { enable = false },
  },
  single_file_support = true,
}

-- lua language server extra configuration
local luals_conf = {
  settings = {
    Lua = {
      completion = { callSnippet = "Replace" },
    }
  }
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

-- list of servers to configure
local lsp_servers = {
  awk_ls = {},
  bashls = {},
  cmake = {},
  cssls = {},
  html = {},
  jsonls = json_conf,
  pyright = {},
  r_language_server = {},
  rust_analyzer = {},
  lua_ls = luals_conf,
  texlab = {}
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
