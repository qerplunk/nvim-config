return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'EdenEast/nightfox.nvim'
    use {
        'rebelot/kanagawa.nvim',
        require('kanagawa').setup {
            colors = {
                --springGreen = "#fefefe",
                sumiInk0 = "#1a1a1a",
                sumiInk1 = "#1c2023",
            }
        }
    }

    use 'kyazdani42/nvim-web-devicons'
    use 'max397574/better-escape.nvim'
    use 'folke/which-key.nvim'
    use 'neovim/nvim-lspconfig'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({
                with_sync = true,
            })
        end
    }

    use 'nvim-treesitter/nvim-treesitter-context'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'L3MON4D3/LuaSnip'

    use 'onsails/lspkind.nvim'

    use { 'feline-nvim/feline.nvim',
        --config = function()
            --require('statusline-config').setup{}
            --require('feline').use_theme('gruvbox')
        --end
        --config = function()
            --require('feline').setup{}
        --end
    }

    use { 'seblj/nvim-tabline', 
        requires = { 'kyazdani42/nvim-web-devicons' },
        require('tabline').setup ({
            no_name = 'Scratch',    -- Name for buffers with no name
            modified_icon = '',      -- Icon for showing modified buffer
            close_icon = '',         -- Icon for closing tab with mouse
            separator = "▌",          -- Separator icon on the left side
            padding = 3,              -- Prefix and suffix space
            color_all_icons = false,  -- Color devicons in active and inactive tabs
            right_separator = false,  -- Show right separator on the last tab
            show_index = false,       -- Shows the index of tab before filename
            show_icon = true,         -- Shows the devicon
        })
    }

    use 'karb94/neoscroll.nvim'

    use {
        "nvim-neorg/neorg",
        run = ":Neorg sync-parsers",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.norg.concealer"] = {},
                    ["core.norg.dirman"] = {
                        config = {
                            workspaces = {
                                school = "~/org/",
                            }
                        }
                    }
                }
            }
        end,
    }

    use { "nvim-telescope/telescope-file-browser.nvim" }

end)

