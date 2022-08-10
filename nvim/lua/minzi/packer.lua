vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-fugitive'
    use {'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}}
    use 'alvan/vim-closetag'
    use 'morhetz/gruvbox'
    use 'TimUntersberger/neogit'
    use 'nvim-lua/popup.nvim'
    use 'jacoborus/tender.vim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'numToStr/Comment.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'romgrk/barbar.nvim'
    -- use {'tzachar/cmp-tabnine', { run = './install.sh'}}
    -- use {'fatih/vim-go', { run = ':GoUpdateBinaries' }}
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua'
    use 'williamboman/nvim-lsp-installer'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind-nvim'
    use 'hoob3rt/lualine.nvim'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'tami5/lspsaga.nvim'
    use 'L3MON4D3/LuaSnip'
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use 'tpope/vim-pathogen'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'sindrets/diffview.nvim'
    use 'folke/todo-comments.nvim'
    use 'pangloss/vim-javascript' 
    use 'leafgarland/typescript-vim' 
    use 'maxmellon/vim-jsx-pretty'
    use 'jparise/vim-graphql' 
    use 'mattn/emmet-vim'
    use 'tpope/vim-dotenv'
end)

