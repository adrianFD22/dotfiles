
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
require("aguachumein.config")
require("aguachumein.remaps")
require("aguachumein.markdown")
require("aguachumein.latex")

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Fuzzy finder: telescope
	--use {
		--'nvim-telescope/telescope.nvim', tag = '0.1.1',
		---- or                            , branch = '0.1.x',
		--requires = { {'nvim-lua/plenary.nvim'} }
	--}

	-- File explorer: nnn
	use {
		"luukvbaal/nnn.nvim",
		config = function() require("nnn").setup({
            explorer = {
                cmd = "nnn -A"
            },
            picker = {
                cmd = "nnn -A"
            },
			auto_open = {
				setup = nil,       -- or "explorer" / "picker", auto open on setup function
				tabpage = nil,     -- or "explorer" / "picker", auto open when opening new tabpage
				empty = false,     -- only auto open on empty buffer
				ft_ignore = {      -- dont auto open for these filetypes
					"gitcommit",
				}
			},
			auto_close = false,
			windownav = {        -- window movement mappings to navigate out of nnn
				left = "<A-h>",
				right = "<A-l>",
				next = "<C-w>w",
				prev = "<C-w>W",
			},
			quitcd = nil,        -- or "cd" / tcd" / "lcd", command to run on quitcd file if found

		}) end
	}

	-- Harpoon
	-- use "ThePrimeagen/harpoon"

	-- Treesitter
	use (
		'nvim-treesitter/nvim-treesitter',
		{run = ':TSUpdate'}
	)

	-- Treesitter playground
	-- use 'nvim-treesitter/playground'

	-- Colorscheme
	use { "sainnhe/gruvbox-material", as = "gruvbox-material" }
    --use { "ellisonleao/gruvbox.nvim" }

    -- LSP zero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    -- UndoTree
    -- use 'mbbill/undotree'

    -- Simple notes
    --use {
        --'/home/adrian/Personal/Projects/simple-notes'
    --}

    -- Easy align
    use {
        'junegunn/vim-easy-align'
    }

    -- Comment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Lean
    --use {
        --'Julian/lean.nvim',
        --event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },
--
        --dependencies = {
            --'neovim/nvim-lspconfig',
            --'nvim-lua/plenary.nvim',
            ---- you also will likely want nvim-cmp or some completion engine
        --},
--
        ---- see details below for full configuration options
        --opts = {
            --lsp = {
                --on_attach = on_attach,
            --},
            --mappings = true,
        --}
    --}

    -- LuaSnip
    --use({
        --"L3MON4D3/LuaSnip",
        ---- follow latest release.
        --tag = "v1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        ---- install jsregexp (optional!:).
        --run = "make install_jsregexp"
    --})
end)
