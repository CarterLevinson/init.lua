local icon   = require 'util.icon'
local snippy = require 'snippy'
local cmp    = require 'cmp'

local function select_next(fallback)
  local opts = { select = true }
  if not cmp.select_next_item(opts) then
    fallback()
  end
end

local function select_prev(fallback)
  local opts = { select = true }
  if not cmp.select_prev_item(opts) then
    fallback()
  end
end

local function close(fallback)
  if not cmp.close() then
    fallback()
  end
end

-- TODO functions for spell / ripgrep
local function complete(fallback)
  if not cmp.complete() then
    fallback()
  end
end

local function abort(fallback)
  if not cmp.abort() then
    fallback()
  end
end

local function scroll_docs(delta)
  return function(fallback)
    if not cmp.scroll_docs(delta) then
      fallback()
    end
  end
end

local function scroll_up(count)
  return function(fallback)
    local opts = { select = false, count = count }
    if not cmp.select_next_item(opts) then
      fallback()
    end
  end
end

local function scroll_down(count)
  return function(fallback)
    local opts = { select = false, count = count }
    if not cmp.select_prev_item(opts) then
      fallback()
    end
  end
end

local function generate_fallback()
  return function(fallback)
    fallback()
  end
end


local function scroll_menu(delta)
  if delta > 0 then
    return scroll_down(delta)
  elseif delta < 0 then
    return scroll_up(math.abs(delta))
  else
    return generate_fallback()
  end
end


local function confirm(fallback)
  if cmp.visible() then
    cmp.confirm { select = true }
  elseif snippy.can_jump(1) then
    snippy.next()
  else
    fallback()
  end
end

local cmp_mapping = {
  ['<C-n>'] = cmp.mapping(select_next),
  ['<C-p>'] = cmp.mapping(select_prev),

  ['<C-j>'] = cmp.mapping(select_next),
  ['<C-k>'] = cmp.mapping(select_prev),

  -- rejects completion
  ['<C-e>'] = cmp.mapping(abort),
  -- accepts completion
  ['<C-y>'] = cmp.mapping(close),

  ['<C-b>'] = cmp.mapping(scroll_docs(-4)),
  ['<C-f>'] = cmp.mapping(scroll_docs(4)),

  ['<C-u>'] = cmp.mapping(scroll_menu(-4)),
  ['<C-d>'] = cmp.mapping(scroll_menu(4)),

  -- ['<C-o>'] = cmp.mapping(complete),

  ['<CR>'] = cmp.mapping(confirm),
}

local cmp_window = cmp.config.window.bordered {
  border = 'double',
}

local cmp_menu = {
  ['buffer']                   = '[β]',
  ['cmdline']                  = '[C]',
  ['snippy']                   = '[𝜎]',
  ['cmp_git']                  = '[𝛾]',
  ['path']                     = '[𝜑]',
  ['omni']                     = '[Ω]',
  ['calc']                     = '[=]',
  ['rg']                       = '[𝜌]',
  ['treesitter']               = '[T]',
  ['lua-latex-symbols']        = '[𝜒]',
  ['nvim_lsp']                 = '[𝜆]',
  ['nvim_lsp_signature_help']  = '[𝜆]',
  ['nvim_lsp_document_symbol'] = '[𝜆]',
  ['nvim-cmp-ts-tag-close']    = '[ ]',
}

local function old_format(entry, item)
  item.kind = ({
    Text = ' ',
    Method = ' ',
    Function = ' ',
    Constructor = ' ',
    Field = 'ﰠ ',
    Variable = ' ',
    Class = ' ',
    Interface = 'ﳤ ',
    Module = ' ',
    Property = '襁',
    Unit = '塞',
    Number = ' ',
    Keyword = ' ',
    Snippet = ' ',
    Color = ' ',
    Enum = '練',
    File = ' ',
    Reference = ' ',
    Folder = ' ',
    EnumMember = 'ﴯ ',
    Constant = ' ',
    Struct = 'פּ ',
    String = ' ',
    Event = ' ',
    Operator = ' ',
    Null = ' ',
    TypeParameter = ' ',
  })[item.kind]
  item.menu = ({
    ['buffer'] = '[β]',
    ['cmdline'] = '[C]',
    ['snippy'] = '[𝜎]',
    ['cmp_git'] = '[𝛾]',
    ['path'] = '[𝜑]',
    ['omni'] = '[Ω]',
    ['treesitter'] = '[T]',
    ['lua-latex-symbols'] = '[𝜒]',
    ['nvim_lsp'] = '[𝜆]',
    ['nvim_lsp_signature_help'] = '[𝜆]',
    ['nvim_lsp_document_symbol'] = '[𝜆]',
    ['nvim-cmp-ts-tag-close'] = '[ ]',
    ['calc'] = '[=]',
    ['rg'] = '[𝜌]',
  })[entry.source.name]
  return item
end

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
      local kinds = icon.kinds

      item.menu = cmp_menu[entry.source.name]
      item.kind = kinds[item.kind]
      -- item.dup = 0

      return item
    end,
  },
  window = {
    completion = cmp_window,
    documentation = cmp_window,
  },
  -- keymaps defined in table above
  mapping = cmp.mapping.preset.insert(cmp_mapping),
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
  mapping = cmp.mapping.preset.cmdline(cmp_mapping),
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
  mapping = cmp.mapping.preset.cmdline(cmp_mapping),
  view = {
    entries = { name = 'custom', selection_order = 'near_cursor' },
  },
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})
