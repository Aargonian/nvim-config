-- [[ opts.lua]]
local opt = vim.opt
local cmd = vim.api.nvim_command

-- [[ Context ]]
opt.colorcolumn = '120'
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.signcolumn = 'yes'

-- [[ Filetypes ]]
opt.encoding = 'utf8'
opt.fileencoding = 'utf8'

-- [[ Theme ]]
opt.syntax = 'ON'
opt.termguicolors = true

-- [[ Search ]]
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

-- [[ Whitespace ]]
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4

-- [[ Splits ]]
opt.splitright = true
opt.splitbelow = true

-- [[ Folding ]]
opt.foldlevelstart = 99


-- -- NVIM-TREE Nonsense
-- local function tab_win_closed(winnr)
--   local api = require"nvim-tree.api"
--   local tabnr = vim.api.nvim_win_get_tabpage(winnr)
--   local bufnr = vim.api.nvim_win_get_buf(winnr)
--   local buf_info = vim.fn.getbufinfo(bufnr)[1]
--   local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
--   local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
--   if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
--     -- Close all nvim tree on :q
--     if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
--       api.tree.close()
--     end
--   else                                                      -- else closed buffer was normal buffer
--     if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
--       local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
--       if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
--         vim.schedule(function ()
--           if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
--             vim.cmd "quit"                                        -- then close all of vim
--           else                                                  -- else there are more tabs open
--             vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
--           end
--         end)
--       end
--     end
--   end
-- end

-- vim.api.nvim_create_autocmd("WinClosed", {
--   callback = function ()
--     local winnr = tonumber(vim.fn.expand("<amatch>"))
--     vim.schedule_wrap(tab_win_closed(winnr))
--   end,
--   nested = true
-- })


-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
opt.completeopt = {'menuone', 'noselect', 'noinsert'}
--opt.shortmess = opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 50)

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Treesitter folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- Vimspector Options
vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
]])

