local opt = vim.opt_local

-- Soft Wrapping
opt.wrap = true                 -- Use visual line wrapping for markdown
opt.linebreak = true            -- Wrap only at word boundaries
opt.breakindent = true          -- Keep indent on wrapped lines
opt.showbreak   = '↳ '          -- prefix for every wrapped screen‑line
opt.whichwrap:append('<,>,h,l') -- let h/l cross wrap boundaries

-- Syntax Highlighting
opt.syntax = "on"

-- Spell Checking
opt.spell = true
opt.spelllang = "en_us"

-- Line Numbering
opt.number = true
opt.relativenumber = false

-- Automatic Line Breaking at a Certain Length
opt.textwidth = 80
opt.colorcolumn = "+1"

-- Auto-Indentation
opt.autoindent = true
opt.smartindent = true

-- Tab Settings
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4

-- -- Concealment for Inline Formatting
opt.conceallevel = 2
opt.concealcursor = "n"

-- Set spell checking for Markdown files
vim.opt.spell = true

-- Remap j/k for gj/gk due to visual line wrapping
vim.keymap.set({'n', 'v'}, 'j', 'gj', { buffer = true, remap = false, silent = true, desc = 'down (screen line)' })
vim.keymap.set({'n', 'v'}, 'k', 'gk', { buffer = true, remap = false, silent = true, desc = 'up   (screen line)' })

-- home/end remaps for screen lines
vim.keymap.set({'n'}, '0', 'g0', { buffer = true, remap = false, silent = true, desc = 'startend        (screen line)' })
vim.keymap.set({'n'}, '^', 'g^', { buffer = true, remap = false, silent = true, desc = 'first non-blank (screen line)' })
vim.keymap.set({'n'}, '$', 'g$', { buffer = true, remap = false, silent = true, desc = 'end             (screen line)' })
