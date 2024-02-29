-- [[ nvim_options.lua]]
local opt = vim.opt                 -- Convenient
local cmd = vim.api.nvim_command    -- Convenient

-- [[ Context ]]
opt.colorcolumn = '120'             -- Color Column 120 for easy line-length checking
opt.number = true                   -- Enable line numbers
opt.relativenumber = false          -- Line numbers relative to the current line
opt.scrolloff = 4                   -- Allow scrolling up to 4 characters past the end
opt.signcolumn = 'yes'              -- Extra gutter for diagnostic signs to show up

-- [[ Filetypes ]]
opt.encoding = 'utf8'               -- Assume files are UTF-8 Encoded
opt.fileencoding = 'utf8'           -- Same

-- [[ Theme ]]
opt.syntax = 'ON'                   -- Syntax Highlighting
opt.termguicolors = true            -- Enable colors

-- [[ Search ]]
opt.ignorecase = true               -- Case-insensitive searching
opt.smartcase = true
opt.incsearch = true                -- Search one item at a time, rather than find-all
opt.hlsearch = false                -- Don't highlight search

-- [[ Whitespace ]]
opt.expandtab = true                -- Change tabs to spaces
opt.shiftwidth = 4                  -- Make tabs 4 spaces
opt.softtabstop = 4
opt.tabstop = 4

-- [[ Clipboard ]]
opt.clipboard = "unnamedplus"

-- [[ Splits ]]
opt.splitright = true               -- New splits to the right by default
opt.splitbelow = true               -- New splits below by default

-- [[ Folding ]]
opt.foldlevelstart = 99

-- Treesitter folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

-- Session Manager Options
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
