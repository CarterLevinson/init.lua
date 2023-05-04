local lspconfig = require("lspconfig")
local pretty    = require("pretty_hover")
local cmp       = require("cmp_nvim_lsp")
local gp        = require("goto-preview")
local api       = vim.api
local lsp       = vim.lsp

local function lsp_format_buffer()
  lsp.buf.format({ async = true })
end

local function pretty_print(obj)
  vim.print(vim.inspect(obj))
end

local function print_lsp_ws_folders()
  pretty_print(lsp.buf.list_workspace_folders())
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspConfig", {}),
  callback = function(ev)
    local opts        = { buffer = ev.buf }

    nmap("gd",        lsp.buf.definition, opts)     -- go to definition
    nmap("gD",        lsp.buf.declaration, opts)    -- go to declaration
    nmap("gr",        lsp.buf.references, opts)     -- list all refs in qf
    nmap("gi",        lsp.buf.implementation, opts) -- list imps in qf

    nmap("gpd",       gp.goto_preview_definition, opts)
    nmap("gpt",       gp.goto_preview_type_definition, opts)
    nmap("gpr",       gp.goto_preview_references, opts)
    nmap("gpc",       gp.close_all_win, opts)

    nmap("K",         pretty.hover, opts)
    nmap("<space>h",  lsp.buf.signature_help, opts)
    nmap("<space>t",  lsp.buf.type_definition, opts)
    nmap("<space>f",  lsp_format_buffer, opts)

    nmap("<space>wa", lsp.buf.add_workspace_folder, opts)
    nmap("<space>wr", lsp.buf.remove_workspace_folder, opts)
    nmap("<space>ls", print_lsp_ws_folders, opts)

    nmap("<space>cl", lsp.codelens.run, opts)

    nmap("<space>rn", ":IncRename " , opts)
    nmap("<space>ca", cmd "CodeActionMenu", opts)
  end,
})

-- enable lsp snippet support
local capabilities = lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- default lsp configuration, others can extend from here
local config = {
  settings = {
    -- create nvim-cmp capabilities for lsp client
    capabilities = cmp.default_capabilities(capabilities),
    -- disable telemetry (if any)
    telemetry = { enable = false },
  },
  -- enable single file mode, if possible
  single_file_support = true,
}

-- list of installed lsp servers with default configurations
local servers = {
  awk_ls = {},
  -- bashls = {},
  cmake = {},
  cssls = {},
  html = {},
  pylsp = {},
  -- pyright = {},
  r_language_server = {},
  rust_analyzer = {},
  texlab = {},
}

-- setup each lsp server in list
for server, _ in pairs(servers) do
  lspconfig[server].setup(config)
end

-- return default config for lsp extension plugins to build configurations
return { default = config }
