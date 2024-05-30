-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

-- Auto install packer.nvim
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Reload configurations if we modify plugins.lua
-- Hint
--    <afile> - replace with the filename of the fuffer being manipulated
vim.cmd([[
	augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

-- Packer init script
local packer = require('packer')
packer.util = require('packer.util')

packer.init({
	git = {
		clone_timeout = 1800,
	},
})

-- Use package
return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	
	-- Coc
	use {'neoclide/coc.nvim', run = "npm ci"}

	-- Simple plugins can be specified as strings
	use 'rstacruz/vim-closer'

	-- Lazy loading:
	-- Load on specific commands
	use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

	-- Load on an autocommand event
	use {'andymass/vim-matchup', event = 'VimEnter'}

	-- Load on a combination of conditions: specific filetypes or commands
	-- Also run code after load (see the "config" key)
	use {
		'w0rp/ale',
		ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
		cmd = 'ALEEnable',
		config = 'vim.cmd[[ALEEnable]]'
	}

	-- Plugins can have dependencies on other plugins
	use {
		'haorenW1025/completion-nvim',
		opt = true,
		requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
	}

	-- Plugins can also depend on rocks from luarocks.org:
	-- use_rocks 'lpeg'
	-- use_rocks {'lua-cjson'}

	-- You can specify rocks in isolation
	-- use_rocks 'penlight'
	-- use_rocks {'lua-resty-http', 'lpeg'}

	-- Local plugins can be included
	-- use '~/projects/personal/hover.nvim'

	-- Plugins can have post-install/update hooks
	use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

	-- Post-install/update hook with neovim command
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Post-install/update hook with call of vimscript function with argument
	use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

	-- Use specific branch, dependency and run lua file after load
	-- use {
	--	 'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
	--	 requires = {'kyazdani42/nvim-web-devicons'}
	-- }

	-- Use dependency and run lua function after load
	use {
		'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}

	-- You can specify multiple plugins in a single call
	use 'tjdevries/colorbuddy.vim'

	-- You can alias plugin names
	use {'dracula/vim', as = 'dracula'}

	-- BlockBegin(coc-extensions)
	use {'fannheyward/coc-pyright', run = 'yarn install --frozen-lockfile'}
	use {'josa42/coc-docker', run = 'yarn install --frozen-lockfile'}
	use {'josa42/coc-lua', run = 'yarn install --frozen-lockfile'}
	use {'neoclide/coc-css', run = 'yarn install --frozen-lockfile'}
	use {'neoclide/coc-git', run = 'yarn install --frozen-lockfile'}
	use {'neoclide/coc-highlight', run = 'yarn install --frozen-lockfile'}
	use {'neoclide/coc-lists', run = 'yarn install --frozen-lockfile'}
	use {'neoclide/coc-prettier', run = 'yarn install --frozen-lockfile'}
	use {'neoclide/coc-snippets', run = 'yarn install --frozen-lockfile'}
	use {'neoclide/coc-tsserver', run = 'yarn install --frozen-lockfile'}
	use {'neoclide/coc-yaml', run = 'yarn install --frozen-lockfile'}
	use {'yaegassy/coc-black-formatter', run = 'yarn install --frozen-lockfile'}
	use {'yaegassy/coc-blade', run = 'yarn install --frozen-lockfile'}
	use {'yaegassy/coc-laravel', run = 'yarn install --frozen-lockfile'}
	use {'yaegassy/coc-mypy', run = 'yarn install --frozen-lockfile'}
	use {'yaegassy/coc-pydocstring', run = 'yarn install --frozen-lockfile'}
	use {'yaegassy/coc-pylsp', run = 'yarn install --frozen-lockfile'}

	-- BlockBegin(DataBase tools)
	use {'tpope/vim-dadbod', run = 'yarn install --frozen-lockfile'}
	use {'tpope/vim-dotenv', run = 'yarn install --frozen-lockfile'}
	use {'kristijanhusak/vim-dadbod-ui', run = 'yarn install --frozen-lockfile'}
	use {'kristijanhusak/vim-dadbod-completion', run = 'yarn install --frozen-lockfile'}

	-- LSP
	use { 'williamboman/mason.nvim' }
	use { 'williamboman/mason-lspconfig.nvim' }

	-- Codeium
	-- Remove the `use` here if you're using folke/lazy.nvim.
	use {
	  'Exafunction/codeium.vim',
	  config = function ()
	    -- Change '<C-g>' here to any keycode you like.
	    vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
	    vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
	    vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
	    vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
	  end
	}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
