-- https://github.com/folke/lazy.nvim
-- Install lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- Load and setup
require("lazy").setup({
	{
		"folke/lazy.nvim",
		opts = {
			checker = {
				-- automatically check for plugin updates
				enabled = true,
			},
		}
	},
	{
		"folke/which-key.nvim",
		cond = not vim.g.vscode,
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
		},
	},
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
		opts = {},
	},
	{
		"folke/neodev.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		settings = {
			Lua = {
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				}
			},
		},
		config = function()
			local configs = require 'lspconfig.configs'

			configs.pylsp.setup {}
			configs.lua_ls.setup {}
		end,
		keys = {
			{ "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>" },
			{ "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>" },
			{ "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "bash", "c", "lua", "vim", "vimdoc", "python", "query", "javascript", "html" },
				sync_install = false,
				highlight = { enable = true },
				incremental_selection = { enable = true },
				indent = { enable = true },
			})

			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
			vim.opt.foldenable = false
		end
	},
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		},
	},
	{
		'NeogitOrg/neogit',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim',
			'nvim-telescope/telescope.nvim',
		},
		config = true
	},
	{
		'Exafunction/codeium.vim',
		event = 'BufEnter',
		cond = not vim.g.vscode, -- use vscode plugin, otherwise will conflict
	},
})

-- vim: ts=2 sts=2 sw=2
