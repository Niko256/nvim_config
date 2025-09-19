vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use "EdenEast/nightfox.nvim" -- Packer

    use {
        'kkoomen/vim-doge',
        run = ':call doge#install()'
    }

    use 'DaikyXendo/nvim-material-icon'

    use 'voldikss/vim-floaterm'

    use "FabianWirth/search.nvim"

    use {
        "danymat/neogen",
    }

    use { 'camspiers/snap' }

    use "meznaric/conmenu"

    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        'vxpm/ferris.nvim',
        requires = { 'mrcjkb/rustaceanvim' },
        after = 'rustaceanvim'
    }


    use {
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    }

    use {
        'olivercederborg/poimandres.nvim',
        config = function()
            require('poimandres').setup {
                -- leave this setup function empty for default config
            }
        end
    }

    use "norcalli/nvim-colorizer.lua"

    use "bassamsdata/namu.nvim"

    use "kyazdani42/blue-moon"

    use "idr4n/github-monochrome.nvim"

    use "projekt0n/github-nvim-theme"

    use { 'embark-theme/vim', as = 'embark' }

    use "yorumicolors/yorumi.nvim"

    use "comfysage/twilight-moon"

    use 'zaldih/themery.nvim'

    use "bluz71/vim-moonfly-colors"

    use "rose-pine/neovim"

    use "vague2k/vague.nvim"

    use {
        'declancm/cinnamon.nvim',
        tag = '*', -- use latest release
        config = function()
            require('cinnamon').setup {
                -- change default options here
            }
        end
    }

    use {
        'ojroques/nvim-lspfuzzy',
        requires = {
            { 'junegunn/fzf' },
            { 'junegunn/fzf.vim' },
        },
    }

    use({
        'ray-x/navigator.lua',
        requires = {
            { 'ray-x/guihua.lua',     run = 'cd lua/fzy && make' },
            { 'neovim/nvim-lspconfig' },
        },
    })

    use {
        'tomasky/bookmarks.nvim',
    }

    use {
        'gelguy/wilder.nvim',
        config = function()
            require('wilder').setup()
        end,
    }

    use "melmass/echo.nvim"


    use "numToStr/FTerm.nvim"

    use 'cdelledonne/vim-cmake'
    use 'mfussenegger/nvim-lint'
    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            -- you'll need at least one of these
            -- {'nvim-telescope/telescope.nvim'},
            -- {'ibhagwan/fzf-lua'},
        },
        config = function()
            require('neoclip').setup()
        end,
    }

    use 'prichrd/netrw.nvim'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use 'nvim-tree/nvim-web-devicons'

    use 'karb94/neoscroll.nvim'
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('theprimeagen/harpoon')
    use('mbbill/undotree')


    use 'wbthomason/packer.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'MunifTanjim/nui.nvim'
    use 'hrsh7th/nvim-cmp'

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            require("barbecue").setup()
        end,
    })

    use {
        'mfussenegger/nvim-dap',
    }

    use {
        'nvim-lua/plenary.nvim'
    }

    -- Rust tools
    use {
        'simrat39/rust-tools.nvim',
        requires = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
    }

    use {
        'Saecki/crates.nvim',
        requires = { "nvim-lua/plenary.nvim" },
    }

    use 'folke/noice.nvim'

    use 'rcarriga/nvim-notify'

    use {
        "SmiteshP/nvim-navbuddy",
        requires = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
            "numToStr/Comment.nvim",        -- Optional
            "nvim-telescope/telescope.nvim" -- Optional
        }
    }

    use({
        "tadmccorkle/markdown.nvim",
        config = function()
            require("markdown").setup({
                -- configuration here or empty for defaults
            })
        end,
    })

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = {
                "markdown" }
        end,
        ft = { "markdown" },
    })
end)
