-- [[ init.lua]]
-- [[ SPEED - Significantly speeds up plugin loading ]]
--vim.loader.enable()

-- LEADER
vim.g.mapleader = ','
vim.g.localleader = '\\'

-- IMPORTS
require('vars')         -- Variables
require('nvim_options') -- Global Neovim Options
require('keys')         -- Global Keymaps

-- Setup Lazy and pull in plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup('plugins', {
    checker = { enabled = false }, -- Disable auto-updates
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
-- Enable LSP Debugging
vim.lsp.set_log_level("debug")
