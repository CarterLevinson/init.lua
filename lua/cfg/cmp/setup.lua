local icon   = require 'util.icon'
local snippy = require 'snippy'
local cmp    = require 'cmp'

local function select_next()
  local opts = { select = true }
  return cmp.mapping.select_next_item(opts)
end

local function select_prev()
  local opts = { select = true }
  return cmp.mapping.select_prev_item(opts)
end

-- accepts completion
local function close()
  return cmp.mapping.close()
end

-- rejects completion
local function abort()
  return cmp.mapping.abort()
end

local function scroll_docs_down(count)
  return cmp.mapping.scroll_docs(count)
end

local function scroll_docs_up(count)
  return cmp.mapping.scroll_docs(-1 * count)
end

local function scroll_menu_down(count)
  local opts = { select = false, count = count }
  return cmp.mapping.select_next_item(opts)
end

local function scroll_menu_up(count)
  local opts = { select = false, count = count }
  return cmp.mapping.select_prev_item(opts)
end

local function confirm()
  return cmp.mapping(function(fallback)
    if cmp.visible() then
      local opts = { select = true }
      cmp.confirm(opts)
    elseif snippy.can_jump(1) then
      snippy.next()
    else
      fallback()
    end
  end)
end

local mapping = {
  ['<C-n>'] = select_next(),
  ['<C-p>'] = select_prev(),

  ['<C-j>'] = select_next(),
  ['<C-k>'] = select_prev(),

  ['<C-e>'] = abort(),
  ['<C-y>'] = close(),

  ['<C-b>'] = scroll_docs_up(4),
  ['<C-f>'] = scroll_docs_down(4),

  ['<C-u>'] = scroll_menu_up(4),
  ['<C-d>'] = scroll_menu_down(4),

  ['<CR>'] = confirm(),
}

local menu = {
  ['rg']                       = '[𝜌]',
  ['path']                     = '[𝜑]',
  ['omni']                     = '[Ω]',
  ['calc']                     = '[=]',
  ['snippy']                   = '[𝜎]',
  ['spell']                    = '[S]',
  ['buffer']                   = '[β]',
  ['cmdline']                  = '[C]',
  ['cmp_git']                  = '[𝛾]',
  ['nvim_lsp']                 = '[𝜆]',
  ['treesitter']               = '[T]',
  ['lua-latex-symbols']        = '[𝜒]',
  ['nvim-cmp-ts-tag-close']    = '[ ]',
  ['nvim_lsp_signature_help']  = '[𝜆]',
  ['nvim_lsp_document_symbol'] = '[𝜆]',
}

-- local function old_format(entry, item)
--   item.kind = ({
--     Text = ' ',
--     Method = ' ',
--     Function = ' ',
--     Constructor = ' ',
--     Field = 'ﰠ ',
--     Variable = ' ',
--     Class = ' ',
--     Interface = 'ﳤ ',
--     Module = ' ',
--     Property = '襁',
--     Unit = '塞',
--     Number = ' ',
--     Keyword = ' ',
--     Snippet = ' ',
--     Color = ' ',
--     Enum = '練',
--     File = ' ',
--     Reference = ' ',
--     Folder = ' ',
--     EnumMember = 'ﴯ ',
--     Constant = ' ',
--     Struct = 'פּ ',
--     String = ' ',
--     Event = ' ',
--     Operator = ' ',
--     Null = ' ',
--     TypeParameter = ' ',
--   })[item.kind]
--   item.menu = ({
--     ['buffer'] = '[β]',
--     ['cmdline'] = '[C]',
--     ['snippy'] = '[𝜎]',
--     ['cmp_git'] = '[𝛾]',
--     ['path'] = '[𝜑]',
--     ['omni'] = '[Ω]',
--     ['treesitter'] = '[T]',
--     ['lua-latex-symbols'] = '[𝜒]',
--     ['nvim_lsp'] = '[𝜆]',
--     ['nvim_lsp_signature_help'] = '[𝜆]',
--     ['nvim_lsp_document_symbol'] = '[𝜆]',
--     ['nvim-cmp-ts-tag-close'] = '[ ]',
--     ['calc'] = '[=]',
--     ['rg'] = '[𝜌]',
--   })[entry.source.name]
--   return item
-- end

local window = cmp.config.window.bordered {
  border = 'double',
}

cmp.setup {
  snippet = {
    expand = function(args)
      snippy.expand_snippet(args.body)
    end,
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require 'cmp-under-comparator'.under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  formatting = {
    -- format: icon[kind] txt menu[src]
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, item)
      local kind = icon.kinds

      item.kind = kind[item.kind]
      item.menu = menu[entry.source.name]

      return item
    end,
  },
  window = {
    completion = window,
    documentation = window,
  },
  -- keymaps defined in table above
  mapping = cmp.mapping.preset.insert(mapping),
  -- default sources for all buffers
  sources = cmp.config.sources {
    { name = 'snippy' },
    { name = 'nvim-cmp-ts-tag-close' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'calc' },
    { name = 'lua-latex-symbols' },
  },
  experimental = {
    ghost_text = { hl_group = 'LspCodeLens' },
  },
}

-- Set configuration for specific filetype (i.e. git commit).
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources {
    { name = 'snippy' },
    { name = 'cmp_git' },
    { name = 'spell' },
    { name = 'rg' },
  },
})

cmp.setup.filetype('markdown', {
  sources = cmp.config.sources {
    { name = 'snippy' },
    { name = 'spell' },
    { name = 'rg' },
  }
})

-- use buffer and lsp document symbol source for `/`
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(mapping),
  view = {
    entries = { name = 'wildmenu', separator = '|' },
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp_document_symbol' },
  }, {
    { name = 'buffer' },
  }),
})

-- use cmdline & path source for ':'
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(mapping),
  view = {
    entries = { name = 'custom', selection_order = 'near_cursor' },
  },
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})
