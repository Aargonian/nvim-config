-- [[ plug.lua ]]

-- Function to check if Packer is installed and install it if not found
local function ensure_packer_installed()
    local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
        return true
    end
    return false
end

-- Function to install the plugins with Packer
local function install_plugins_with_packer(just_installed_packer)
    require('packer').startup(function(use)
        -- Your existing plugin configurations
        -- Replace the 'use' statements in your 'plug.lua' file with the ones here
        -- For example:
        -- use 'kyazdani42/nvim-tree.lua'
        -- use 'hoob3rt/lualine.nvim'
        use 'wbthomason/packer.nvim'

        -- [[ Navigation and UI ]]
        use 'nvim-tree/nvim-web-devicons'
        use 'nvim-tree/nvim-tree.lua'
        use 'romgrk/barbar.nvim'                -- For the love of good I need good tabpage headers

        -- use 'Yggdroot/indentLine'

        -- [[ Git and VCS ]]
        use 'tpope/vim-fugitive'                -- More git stuff
        use 'lewis6991/gitsigns.nvim'           -- Added/Removed/Modified Git Lines and Such
        --use 'junegunn/gv.vim'                   -- Idk something with git

        -- [[ Basic Code Editing ]]
        use 'tpope/vim-commentary'              -- Uncomment/Comment lines of code with gc
        use {
            'phaazon/hop.nvim',
            branch = 'v2',
            config = function()
                require('hop').setup({keys = 'etovxqpdygfblzhckisuran' })
            end
        }

        -- [[ Rust & LSP ]]
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use 'neovim/nvim-lspconfig'
        use 'simrat39/rust-tools.nvim'
        use 'nvim-treesitter/nvim-treesitter'

        -- [[ Debugging/CodeLLDB ]]
        use 'puremourning/vimspector'

        ---- [[ Completion Framework ]]
        use 'hrsh7th/nvim-cmp'

        ---- [[ LSP Completion Source ]]
        use 'hrsh7th/cmp-nvim-lsp'

        ---- [[ Useful Completion Sources ]]
        use 'hrsh7th/cmp-nvim-lua'
        use 'hrsh7th/cmp-nvim-lsp-signature-help'
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/vim-vsnip'

        -- [[ Terminal ]]
        use 'voldikss/vim-floaterm'

        -- [[ Theme ]]
        use 'mhinz/vim-startify'
        use 'DanilaMihailov/beacon.nvim'
        use 'nvim-lualine/lualine.nvim'
        use 'Mofiqul/dracula.nvim'
        use 'ellisonleao/gruvbox.nvim'
        use 'sainnhe/gruvbox-material'
        use 'sainnhe/everforest'
        use {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && \
            cmake --build build --config Release && \
            cmake --install build --prefix build'
        }
        use {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.1',
            requires = {
                {'nvim-lua/plenary.nvim'}
            }
        }
        use 'preservim/tagbar'
        use {
            "folke/trouble.nvim",
            requires = "nvim-tree/nvim-web-devicons",
            config = function() require("trouble").setup {
            }
        end
    }

    use 'vim-autoformat/vim-autoformat'
end)

-- Automatically install plugins if there are any missing, and if packer was just installed
if just_installed_packer then
    require('packer').sync()
end
end

-- Ensure Packer is installed and install plugins
local just_installed_packer = ensure_packer_installed()
install_plugins_with_packer(just_installed_packer)

