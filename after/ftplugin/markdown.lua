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
opt.textwidth = 120
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

-- -- Markdown Specific Mappings (add your mappings here)

-- -- Filetype-Specific Commands (add any commands you want to run for Markdown files)

-- -- Modeline Settings
-- opt.modeline = false

-- Set background and foreground for Markdown files
vim.cmd [[
  highlight Normal guibg=#000000 guifg=#FFFFFF ctermbg=0 ctermfg=15
  highlight htmlBold guifg=#fabd2f ctermfg=214
  highlight htmlItalic guifg=#b8bb26 ctermfg=142
  highlight mkdLink guifg=#ffff00 gui=bold ctermfg=226 cterm=bold
]]

-- Auto format long lines on opening Markdown files
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.md",
  callback = function()
    vim.cmd("normal gggqG")
  end,
})

-- Set spell checking for Markdown files
vim.opt.spell = true
