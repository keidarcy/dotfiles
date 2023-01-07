local function setup()
	-- Indicate first time installation
	local packer_bootstrap = false

	-- packer.nvim configuration
	local config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	}

	-- Check if packer.nvim is installed
	-- Run PackerCompile if there are changes in this file
	local function packer_init()
		local fn = vim.fn
		local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
		if fn.empty(fn.glob(install_path)) > 0 then
			packer_bootstrap = fn.system({
				"git",
				"clone",
				"--depth",
				"1",
				"https://github.com/wbthomason/packer.nvim",
				install_path,
			})
			vim.cmd([[packadd packer.nvim]])
		end
		vim.cmd("autocmd BufWritePost plugins.lua source <afile> | PackerCompile")
	end

	local function plugins(use)
		-- Packer can manage itself
		use("wbthomason/packer.nvim")

		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			-- or                            , branch = '0.1.x',
			requires = { { "nvim-lua/plenary.nvim" } },
		})

		-- theme
		use({
			"rose-pine/neovim",
			as = "rose-pine",
		})
		use({ "ellisonleao/gruvbox.nvim" })

		-- treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use("nvim-treesitter/playground")
		use("p00f/nvim-ts-rainbow")

		-- git
		use("tpope/vim-fugitive")
		use({
			"lewis6991/gitsigns.nvim",
			-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
		})

		-- lsp
		use({
			"VonHeikemen/lsp-zero.nvim",
			requires = {
				-- LSP Support
				{ "neovim/nvim-lspconfig" },
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },

				-- Autocompletion
				{ "hrsh7th/nvim-cmp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "saadparwaiz1/cmp_luasnip" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lua" },

				-- Snippets
				{ "L3MON4D3/LuaSnip" },
				{ "rafamadriz/friendly-snippets" },
			},
		})
		use("github/copilot.vim")
		use("folke/zen-mode.nvim")
		use("mhartington/formatter.nvim")

		-- terminal
		use("akinsho/toggleterm.nvim")

		-- keymap
		use("folke/which-key.nvim")

		-- better view
		use({
			"nvim-tree/nvim-tree.lua",
			requires = {
				"nvim-tree/nvim-web-devicons", -- optional, for file icons
			},
			tag = "nightly", -- optional, updated every week. (see issue #1193)
		})
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		use("theprimeagen/harpoon")
		use("mbbill/undotree")
		use({
			"goolord/alpha-nvim",
			config = function()
				require("keidarcy.alpha").setup()
			end,
		})
		use("lukas-reineke/indent-blankline.nvim")
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
		})
		use("RRethy/vim-illuminate")

		-- better edit
		use("tpope/vim-commentary")
		use("tpope/vim-surround")
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})
	end

	if packer_bootstrap then
		print("Restart Neovim required after installation!")
		require("packer").sync()
	end

	packer_init()

	local packer = require("packer")
	packer.init(config)
	packer.startup(plugins)
end

setup()
