local snippy_mapping  = require("snippy.mapping")
local snippy          = require ("snippy")
local cmp             = require("cmp")
local set             = vim.opt

-- for license snippets
vim.g.snips_author = "Carter S. Levinson"

-- snippy mappings
imap("<Tab>",    snippy_mapping.expand_or_advance("<Tab>"))
smap("<Tab>",    snippy_mapping.next("<Tab>"))
ismap("S-<Tab>", snippy_mapping.previous("S-<Tab>"))
xmap("<Tab>",    snippy_mapping.cut_text, { remap = true })
nmap("g<Tab>",   snippy_mapping.cut_text, { remap = true })

local function select_next(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    fallback()
  end
end

local function select_prev(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  else
    fallback()
  end
end

local function abort(fallback)
  if cmp.visible() then
    cmp.abort()
  else
    fallback()
  end
end

local function close(fallback)
  if cmp.visible() then
    cmp.close()
  else
    fallback()
  end
end

local function confirm(fallback)
  local opts = { select = false, behavior = cmp.ConfirmBehavior.Replace }
  if cmp.visible() then
    cmp.confirm(opts)
  else
    fallback()
  end
end

local cmp_mappings = {
  ["<C-n>"] = cmp.mapping(select_next),
  ["<C-p>"] = cmp.mapping(select_prev),

  ["<C-j>"] = cmp.mapping(select_next),
  ["<C-k>"] = cmp.mapping(select_prev),

  ["<C-a>"] = cmp.mapping(abort),
  ["<C-e>"] = cmp.mapping(close),

  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-b>"] = cmp.mapping.scroll_docs(-4),

  ["<CR>"] = cmp.mapping(confirm),
}

-- set vim's completopt
set.completeopt = { "menu", "menuone", "noselect" }

-- setup nvim-cmp
cmp.setup {
  snippet = {
    expand = function(args)
      snippy.expand_snippet(args.body)
    end
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      -- extra sorting comparators
      require "clangd_extensions.cmp_scores",
      require "cmp-under-comparator".under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  -- keymaps defined in table above
  mapping = cmp.mapping.preset.insert(cmp_mappings),
  -- format: icon[kind] txt menu[src]
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, item)
      item.kind = ({
        Text                         = ' ',
        Method                       = ' ',
        Function                     = ' ',
        Constructor                  = ' ',
        Field                        = 'ﰠ ',
        Variable                     = ' ',
        Class                        = ' ',
        Interface                    = 'ﳤ ',
        Module                       = ' ',
        Property                     = '襁',
        Unit                         = '塞',
        Number                       = ' ',
        Keyword                      = ' ',
        Snippet                      = ' ',
        Color                        = ' ',
        Enum                         = '練',
        File                         = ' ',
        Reference                    = ' ',
        Folder                       = ' ',
        EnumMember                   = 'ﴯ ',
        Constant                     = ' ',
        Struct                       = 'פּ ',
        String                       = ' ',
        Event                        = ' ',
        Operator                     = ' ',
        Null                         = ' ',
        TypeParameter                = ' ',
      })[item.kind]
      item.menu = ({
        ["buffer"]                   = '[β]',
        ["cmdline"]                  = '[C]',
        ["snippy"]                   = '[𝜎]',
        ["git"]                      = '[𝛾]',
        ["path"]                     = '[𝜑]',
        ["omni"]                     = '[Ω]',
        ["treesitter"]               = '[T]',
        ["lua-latex-symbols"]        = '[𝜒]',
        ["nvim_lsp"]                 = '[𝜆]',
        ["nvim_lsp_signature_help"]  = '[𝜆]',
        ["nvim_lsp_document_symbol"] = '[𝜆]',
        -- ["vim-dadbod-completion"]    = '[𝛿]',
        -- ["rg"]                       = '[𝜌]',
      })[entry.source.name]
      return item
    end
  },
  experimental = {
    ghost_text = true,
    { hl_group = "LspCodeLens" }
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lsp" },
    { name = "snippy" },
    { name = "buffer" },
    { name = "path" },
    { name = "lua-latex-symbols" },
  },
}

-- Set configuration for specific filetype (i.e. git commit).
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources {
    { name = "git" },
    { name = "snippy" },
    { name = "buffer" },
  }
})

-- for LaTeX files
cmp.setup.filetype({ "tex", "plaintex" }, {
  sources = cmp.config.sources {
    { name = "omni" }, -- for VimTeX
    { name = "nvim_lsp" },
    { name = "snippy" },
    { name = "buffer" },
  }
})

-- -- for treesitter quereies
cmp.setup.filetype("query", {
  sources = cmp.config.sources({
    { name = "omni" },
    { name = "treesitter" },
    { name = "buffer" }
  })
})

-- -- set up database integration
-- cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
--   sources = cmp.config.sources({
--     { name = "vim-dadbod-completion" }
--   }, {
--     { name = "buffer" }
--   })
-- })

-- use buffer and lsp document symbol source for `/`
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(cmp_mappings),
  view = {
    entries = { name = 'wildmenu', separator = '|' }
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp_document_symbol" }
  }, {
    { name = "buffer" }
  })
})

-- use cmdline & path source for ':'
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(cmp_mappings),
  view = {
    entries = { name = "custom", selection_order = "near_cursor" }
  },
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" }
  }),
})
