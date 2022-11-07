local fn = vim.fn

local plugins = {

	-- Plugin manager
	["wbthomason/packer.nvim"] = {},

	-- File explorer
	["nvim-neo-tree/neo-tree.nvim"] = {
		branch = "v2.x",
		module = "neo-tree",
		cmd = "Neotree",
		requires = { { "MunifTanjim/nui.nvim", module = "nui" } },
		setup = function()
			vim.g.neo_tree_remove_legacy_commands = true
		end,
		config = function()
			require("plugins.neo-tree")
		end,
	},
	["nvim-lua/plenary.nvim"] = {},

	-- Coloscheme
	["Shatur/neovim-ayu"] = {
		config = function()
			require("user.colorscheme")
		end,
	},

	-- Whichkey
	["folke/which-key.nvim"] = {
		config = function()
			require("plugins.whichkey")
		end,
	},

	-- Tabs
	["akinsho/bufferline.nvim"] = {
		config = function()
			require("plugins.bufferline")
		end,
	},
	["moll/vim-bbye"] = {},

	-- Maximize splits
	["szw/vim-maximizer"] = {},

	-- Surround words with: "({[
	["tpope/vim-surround"] = {},

	-- Comment stuff
	["numToStr/Comment.nvim"] = {
		config = function()
			require("plugins.comment")
		end,
	},

	-- Icons
	["kyazdani42/nvim-web-devicons"] = {},

	-- Telescope, Fzfinder
	["nvim-telescope/telescope.nvim"] = {
		config = function()
			require("plugins.telescope")
		end,
	},
	["nvim-telescope/telescope-media-files.nvim"] = {},
	["nvim-telescope/telescope-fzf-native.nvim"] = {},
	["ahmedkhalf/project.nvim"] = {
		config = function()
			require("plugins.project")
		end,
	},
	["ibhagwan/fzf-lua"] = {},

	-- Dashboard Init
	["goolord/alpha-nvim"] = {
		config = function()
			require("plugins.alpha")
		end,
	},

	-- Auto completions
	["hrsh7th/cmp-buffer"] = {}, -- buffer completions
	["hrsh7th/cmp-path"] = {}, -- path completions
	["hrsh7th/cmp-cmdline"] = {}, -- cmdline completions
	["hrsh7th/cmp-nvim-lsp"] = {},
	["hrsh7th/cmp-emoji"] = {},
	["hrsh7th/cmp-nvim-lua"] = {},
	["hrsh7th/nvim-cmp"] = {
		config = function()
			require("plugins.cmp")
		end,
	},
	-- Shippets
	["L3MON4D3/LuaSnip"] = {},
	["saadparwaiz1/cmp_luasnip"] = {},
	["rafamadriz/friendly-snippets"] = {},

	-- Manage and Install LSP servers
	["williamboman/mason-lspconfig"] = {},
	["williamboman/mason.nvim"] = {
		config = function()
			require("plugins.lsp.mason")
		end,
	},

	-- Config for LSP Servers
	["glepnir/lspsaga.nvim"] = {
		config = function()
			require("plugins.lsp.lspsaga")
		end,
	},
	["onsails/lspkind.nvim"] = {},
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.lsp.lspconfig")
		end,
	},

	-- Formatting
	["jayp0521/mason-null-ls.nvim"] = {},
	["jose-elias-alvarez/null-ls.nvim"] = {
		config = function()
			require("plugins.lsp.null-ls")
		end,
	},

	-- Treesitter
	["nvim-treesitter/nvim-treesitter"] = {
		config = function()
			require("plugins.treesitter")
		end,
	},
	["JoosepAlviste/nvim-ts-context-commentstring"] = {},
	["p00f/nvim-ts-rainbow"] = {},
	["nvim-treesitter/playground"] = {},

	-- Auto closing
	["windwp/nvim-autopairs"] = {
		config = function()
			require("plugins.autopairs")
		end,
	},
	["windwp/nvim-ts-autotag"] = {},

	-- Git integration
	["lewis6991/gitsigns.nvim"] = {
		config = function()
			require("plugins.gitsigns")
		end,
	},
	["f-person/git-blame.nvim"] = {
		config = function()
			require("plugins.git-blame")
		end,
	},
	["ruifm/gitlinker.nvim"] = {
		config = function()
			require("plugins.gitlinker")
		end,
	},
	["mattn/vim-gist"] = {},
	["mattn/webapi-vim"] = {},
}

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

local status_ok, packer = pcall(require, "packer")
if status_ok then
	packer.startup({
		function(use)
			for key, plugin in pairs(plugins) do
				if type(key) == "string" and not plugin[1] then
					plugin[1] = key
				end
				use(plugin)
			end
		end,
		config = {
			display = {
				open_fn = function()
					return require("packer.util").float({ border = "rounded" })
				end,
			},
			profile = {
				enable = true,
				threshold = 0.0001,
			},
			git = {
				clone_timeout = 300,
				subcommands = {
					update = "pull --rebase",
				},
			},
			auto_clean = true,
			compile_on_sync = true,
		},
	})
end
