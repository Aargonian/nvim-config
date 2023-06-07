local map = vim.api.nvim_set_keymap

-- Vimspector
map('n', '<F9>', '<cmd>call vimspector#Launch()<cr>', {noremap = true})
map('n', '<F5>', '<cmd>call vimspector#StepOver()<cr>', {noremap = true})
map('n', '<F8>', '<cmd>call vimspector#Reset()<cr>', {noremap = true})
map('n', '<F11>', '<cmd>call vimspector#StepOver()<cr>', {noremap = true})
map('n', '<F12>', '<cmd>call vimspector#StepOut()<cr>', {noremap = true})
map('n', '<F10>', '<cmd>call vimspector#StepInto()<cr>', {noremap = true})
map('n', "<Leader>Db", ":call vimspector#ToggleBreakpoint()<cr>", {})
map('n', "<Leader>Dw", ":call vimspector#AddWatch()<cr>", {})
map('n', "<Leader>De", ":call vimspector#Evaluate()<cr>", {})

vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
]])

