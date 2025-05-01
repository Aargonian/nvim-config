local opt = vim.opt_local

-- Soft Wrapping
opt.wrap = false
opt.linebreak = true
opt.breakindent = true

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
