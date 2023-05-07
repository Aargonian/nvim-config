-- [[ keys.lua ]]
local g = vim.g
local map = vim.api.nvim_set_keymap

-- Function to swap windows based on the direction
_G.swap_window = function(direction)
  local cmd
  if direction == "left" then
    cmd = "wincmd h"
  elseif direction == "right" then
    cmd = "wincmd l"
  else
    return
  end

  local cur_win = vim.api.nvim_get_current_win()
  local cur_buf = vim.api.nvim_get_current_buf()

  vim.cmd(cmd)

  local other_win = vim.api.nvim_get_current_win()
  local other_buf = vim.api.nvim_get_current_buf()

  if cur_win ~= other_win then
    vim.api.nvim_set_current_win(cur_win)
    vim.api.nvim_win_set_buf(cur_win, other_buf)
    vim.api.nvim_set_current_win(other_win)
    vim.api.nvim_win_set_buf(other_win, cur_buf)
  end
end


map('n', '<Leader>n', ':NvimTreeToggle<CR>', { silent = true })
map('n', '_', ':split<CR>', {silent = true})
map('n', '|', ':vsplit<CR>', {silent = true})

-- Remap pane navigation
map('n', '<C-h>', '<C-w>h', {silent = true})
map('n', '<C-j>', '<C-w>j', {silent = true})
map('n', '<C-k>', '<C-w>k', {silent = true})
map('n', '<C-l>', '<C-w>l', {silent = true})
map('n', '<C-Left>', ':vertical resize +3<CR>', {silent = true})
map('n', '<C-Right>', ':vertical resize -3<CR>', {silent = true})
map('n', '<C-Up>', ':resize -3<CR>', {silent = true})
map('n', '<C-Down>', ':resize +3<CR>', {silent = true})

-- Terminal Mappings
-- map('n', '<Leader>nt', ':FloatermNew --name=guake --height=0.5 --width=0.5 --autoclose=2 zsh <CR>', {silent = true})
map('n', '<Leader>t', ':FloatermToggle guake<CR>', {silent = true})
map('t', '<Leader>t', '<C-\\><C-n>:q<CR>', {silent = true})
map('t', '<Esc>', '<C-\\><C-n>', {silent = true})


-- Vimspector
vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>
nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>)
nmap <F12> <cmd>call vimspector#StepOut()<cr>)
nmap <F10> <cmd>call vimspector#StepInto()<cr>)
]])
map('n', "<Leader>Db", ":call vimspector#ToggleBreakpoint()<cr>", {})
map('n', "<Leader>Dw", ":call vimspector#AddWatch()<cr>", {})
map('n', "<Leader>De", ":call vimspector#Evaluate()<cr>", {})

require('barbar-keys')

-- Swap windows
map('n', '<C-S-h>', '<Cmd>lua _G.swap_window("left")<CR>', {silent = true})
map('n', '<C-S-l>', '<Cmd>lua _G.swap_window("right")<CR>', {silent = true})

-- Close windows
map('n', '<C-c>', ':confirm bd<CR>', {silent = true})

-- HOP
map('n', '<Leader>h', ':HopWord<CR>', {silent = true})

-- Telescope
map('n', '<Leader>ff', ':Telescope find_files<CR>', {silent = true})
map('n', '<Leader>ft', ':Telescope live_grep<CR>', {silent = true})

-- Tagbar
map('n', '<Leader>;', ':TagbarToggle<CR>', {silent = true})
map('n', '<Leader>x', ':TroubleToggle workspace_diagnostics<CR>', {silent = true})
