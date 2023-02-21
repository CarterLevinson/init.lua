local snippy   = require "snippy.mapping"
local cmp      = require "cmp"
local set      = vim.opt

-- for license snippets
vim.g.snips_author = "Carter S. Levinson"

-- snippy mappings
imap("<Tab>",    snippy.expand_or_advance("<Tab>"))
smap("<Tab>",    snippy.next("<Tab>"))
ismap("S-<Tab>", snippy.previous("S-<Tab>"))
xmap("<Tab>",    snippy.cut_text, { remap = true })
nmap("g<Tab>",   snippy.cut_text, { remap = true })

-- cmp mappings
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

local function close_window(fallback)
  if cmp.visible() then
    cmp.close()
  else
    fallback()
  end
end

local function abort_completion(fallback)
  if cmp.visible() then
    cmp.abort()
  else
    fallback()
  end
end

local function select_entry(fallback)
  if cmp.visible() then
    cmp.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })
  else
    fallback()
  end
end

local cmp_mappings = {
  ["<C-n>"]     = cmp.mapping(select_next),
  ["<C-p>"]     = cmp.mapping(select_prev),
  ["<C-j>"]     = cmp.mapping(select_next),
  ["<C-k>"]     = cmp.mapping(select_prev),
  ["<C-a>"]     = cmp.mapping(abort_completion),
  ["<C-c>"]     = cmp.mapping(close_window),
  ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
  ["<C-f>"]     = cmp.mapping.scroll_docs(4),
  ["<C-space>"] = cmp.mapping(select_entry)
}

-- set vim's completopt
set.completeopt = { "menu", "menuone", "noselect" }

-- setup nvim-cmp
cmp.setup {
  -- nvim snippy
  snippet = {
    expand = function(args)
      require "snippy".expand_snippet(args.body)
    end,
  },
  -- borders
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  -- comparators
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require "clangd_extensions.cmp_scores",
      require "cmp-under-comparator".under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  -- keymaps defined above
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
            Value                        = ' ',
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
            Event                        = ' ',
            Operator                     = ' ',
            TypeParameter                = ' ',
          })[item.kind]
      item.menu = ({
            ["buffer"]                   = '[β]',
            ["cmdline"]                  = '[C]',
            ["snippy"]                   = '[𝜎]',
            ["git"]                      = '[𝛾]',
            ["path"]                     = '[𝜑]',
            ["omni"]                     = '[Ω]',
            ["rg"]                       = '[𝜌]',
            ["treesitter"]               = '[T]',
            ["lua-latex-symbols"]        = '[𝜒]',
            ["vim-dadbod-completion"]    = '[𝛿]',
            ["nvim_lsp"]                 = '[𝜆]',
            ["nvim_lsp_signature_help"]  = '[𝜆]',
            ["nvim_lsp_document_symbol"] = '[𝜆]',
          })[entry.source.name]
      return item
    end,
  },
  -- set up sources
  sources = cmp.config.sources({
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lsp" },
    { name = "snippy" },
    { name = "rg", max_item_count = 15 },
    { name = "path" },
    { name = "lua-latex-symbols" },
  })
}

-- Set configuration for specific filetype (i.e. git commit).
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" },
    { name = "snippy" },
    { name = "buffer" },
  })
})

-- for LaTeX files
cmp.setup.filetype({ "tex", "plaintex" }, {
  sources = cmp.config.sources({
    { name = "omni" },
    { name = "nvim_lsp" },
    { name = "snippy" },
    { name = "buffer" },
  })
})

-- for treesitter quereies
cmp.setup.filetype("query", {
  sources = cmp.config.sources({
    { name = "omni" },
    { name = "treesitter" }
  }, {
    { name = "buffer" }
  })
})

-- set up database integration
cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
  sources = cmp.config.sources({
    { name = "vim-dadbod-completion" }
  }, {
    { name = "buffer" }
  })
})

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
