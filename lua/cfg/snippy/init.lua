local snippy_mapping = require 'snippy.mapping'

-- provide author name for the license snippets
vim.g.snips_author = 'Carter S. Levinson'

-- snippy main mappings
imap('<Tab>',    snippy_mapping.expand_or_advance '<Tab>')
smap('<Tab>',    snippy_mapping.next '<Tab>')
ismap('S-<Tab>', snippy_mapping.previous 'S-<Tab>')
xmap('<Tab>',    snippy_mapping.cut_text, { remap = true })
nmap('g<Tab>',   snippy_mapping.cut_text, { remap = true })

-- extra snippy mappings
ismap('<C-j>',   snippy_mapping.next '<C-j>')
ismap('<C-k>',   snippy_mapping.previous '<C-k>')
