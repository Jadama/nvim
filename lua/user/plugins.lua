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
	["Shatur/neovim-ayu"] = {},
	["ellisonleao/gruvbox.nvim"] = {},
  ["EdenEast/nightfox.nvim"] = {},

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
	["tiagovla/scope.nvim"] = {
		config = function()
			require("scope").setup()
		end,
	},

	-- Maximize splits
	["szw/vim-maximizer"] = {},

	-- Surround words with: "({[
	["kylechui/nvim-surround"] = {
		config = function()
			require("plugins.surround")
		end,
	},

	-- Repeat plugin actions
	["tpope/vim-repeat"] = {},

	-- Comment stuff
	["numToStr/Comment.nvim"] = {
		config = function()
			require("plugins.comment")
		end,
	},

	-- Icons
	["kyazdani42/nvim-web-devicons"] = {
		config = function()
			require("plugins.nvim-webdev-icons")
		end,
	},

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

  -- LSP and Completion stuff
  ["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.lsp.lspconfig")
		end,
	},

	["neoclide/coc.nvim"] = {
		branch = "release",
    config = function()
      require("plugins.coc")
    end
	},

  ["github/copilot.vim"] = {},

	-- Treesitter
	["nvim-treesitter/nvim-treesitter"] = {
		config = function()
			require("plugins.treesitter")
		end,
	},
  ["nvim-treesitter/nvim-treesitter-textobjects"] = {
    after = "nvim-treesitter"
  },
	["JoosepAlviste/nvim-ts-context-commentstring"] = {},
	["p00f/nvim-ts-rainbow"] = {},
	["nvim-treesitter/playground"] = {},
  ["nvim-treesitter/nvim-treesitter-context"] = {},

	-- Auto closing
	-- ["windwp/nvim-autopairs"] = {
	-- 	config = function()
	-- 		require("plugins.autopairs")
	-- 	end,
	-- },
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

	-- Color
	["NvChad/nvim-colorizer.lua"] = {
		config = function()
			require("plugins.colorize")
		end,
	},

	-- Sessions TODO: Check the keybinds
	["rmagatti/auto-session"] = {
		config = function()
			require("plugins.auto-session")
		end,
	},

	-- UI
	["stevearc/dressing.nvim"] = {
		config = function()
			require("plugins.dressing")
		end,
	},
["SmiteshP/nvim-navic"] = {
		config = function()
			require("plugins.navic")
		end,
		requires = { { "neovim/nvim-lspconfig" } },
	},
  -- ['vim-airline/vim-airline'] ={},
	["kshenoy/vim-signature"] = {},

	-- Notification
	["rcarriga/nvim-notify"] = {
		config = function()
			require("plugins.notify")
		end,
	},

	-- Smooth scroll
	["karb94/neoscroll.nvim"] = {
		config = function()
			require("plugins.neoscroll")
		end,
	},

	-- Match up blocks of code TODO: Check keybinds
	["andymass/vim-matchup"] = {
		config = function()
			require("plugins.matchup")
		end,
	},

	-- Bookmarks
	["MattesGroeger/vim-bookmarks"] = {
		config = function()
			require("plugins.bookmark")
		end,
	},

	-- Harpoon
	["ThePrimeagen/harpoon"] = {
		config = function()
			require("plugins.harpoon")
		end,
	},

	-- Todo Comment TODO: Check the keybinds
	["folke/todo-comments.nvim"] = {
		config = function()
			require("plugins.todo-comments")
		end,
	},

	-- toggle Term TODO: Check the keybinds
	["akinsho/toggleterm.nvim"] = {
		config = function()
			require("plugins.toggle-term")
		end,
	},

	-- Vista: Ctags vizualizer TODO: Check the keybinds
	["liuchengxu/vista.vim"] = {},

	-- Impatient optimize the startup time
	["lewis6991/impatient.nvim"] = {},

	-- Spectre: Better find and replace
	["windwp/nvim-spectre"] = {
		config = function()
			require("plugins.spectre")
		end,
	},

	-- Diffview
	["sindrets/diffview.nvim"] = {
		config = function()
			require("diffview").setup()
		end,
	},
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
