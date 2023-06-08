-- [[ plug.lua ]]
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    -- [[ REQUIRED: Packer ]]
    use 'wbthomason/packer.nvim'

    -- [[ Common Dependencies and Libraries ]]
    use 'nvim-treesitter/nvim-treesitter'   -- Enhanced Syntax Parsing and Highlighting
    use 'nvim-tree/nvim-web-devicons'       -- NERDFont icons for many plugins
    use 'neovim/nvim-lspconfig'             -- Configs for various LSP Servers
    use {                                   -- Package Manager for LSPs, DAP, Linters, etc.
        'williamboman/mason.nvim',
        run = ':MasonUpdate' -- Update Registry Contents
    }
    use 'williamboman/mason-lspconfig.nvim' -- LSP Configs
    use 'nvim-lua/plenary.nvim'

    -- [[ LSP Completion Source ]]
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/nvim-cmp'                  -- NVIM Completion Framework

    -- [[ Other LSP ]]
    use 'j-hui/fidget.nvim'                 -- Visualize LSP Progress

    -- [[ Refactoring ]]
    use 'ThePrimeagen/refactoring.nvim'

    -- [[ Navigation and UI ]]
    use 'nvim-tree/nvim-tree.lua'           -- Filetree plugin
    use 'romgrk/barbar.nvim'                -- Tabs for Buffers and easy buffer use
    -- use 'Yggdroot/indentLine'               -- Show Indent Guides for Space Indents

    use {                                   -- Move around very quickly
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require('hop').setup({keys = 'etovxqpdygfblzhckisuran' })
        end
    }

    -- [[ Telescope Navigation ]]
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = {
            {'nvim-lua/plenary.nvim'}
        }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && \
        cmake --build build --config Release && \
        cmake --install build --prefix build'
    }
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-telescope/telescope-project.nvim'

    -- [[ General Cleanup and Save Plugins ]]
    use 'mboughaba/vim-lessmess'            -- Remove trailing whitespace, mixed, etc.
    use 'jose-elias-alvarez/null-ls.nvim'   -- Not really sure actually

    -- [[ Git and VCS ]]
    use 'tpope/vim-fugitive'                -- Git commands with :G/:Git
    use 'lewis6991/gitsigns.nvim'           -- Added/Removed/Modified Git Lines and Such
    use 'junegunn/gv.vim'                   -- See Git Commit Log with :GV

    -- [[ Basic Code Editing ]]
    use 'tpope/vim-commentary'              -- Uncomment/Comment lines of code with gc

    -- [[ Rust ]]
    use 'simrat39/rust-tools.nvim'          -- Tools to make rust-analyzer LSP better

    -- [[ Debugging/CodeLLDB ]]
    use 'puremourning/vimspector'           -- Debugger for VIM

    -- [[ Terminal ]]
    use 'voldikss/vim-floaterm'             -- Awesome Floating Terminal

    -- [[ Theme ]]
    --use 'Shatur/neovim-session-manager'     -- Base Session Manager
    use 'rmagatti/auto-session'             -- Another Manager
    use {
        'goolord/alpha-nvim',               -- Session Manager
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }
    -- use 'mhinz/vim-startify'                -- Session Manager
    use 'DanilaMihailov/beacon.nvim'        -- Show me where my cursor is when switching panes
    use 'nvim-lualine/lualine.nvim'         -- Status Line
    use 'Mofiqul/dracula.nvim'              -- Dracula Colorscheme
    use 'ellisonleao/gruvbox.nvim'          -- Good ol' Gruvbox Colorscheme
    use 'sainnhe/gruvbox-material'          -- Gruvbox Material Colorscheme (Easier on the eyes)
    use 'sainnhe/everforest'                -- Everforeset Colorscheme

    -- [[ Miscellaneous ]]
    use 'preservim/tagbar'                  -- Tag Browser (Structures/Classes/Methods in File)
    use 'folke/trouble.nvim'                -- Super Cool LSP Message Window
end)

if packer_bootstrap then
    require("packer").sync()
    return
end
