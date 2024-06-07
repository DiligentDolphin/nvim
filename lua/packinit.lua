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
  },
  { 
    "folke/neodev.nvim",
  },
  { 
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate" ,
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })

      vim.opt.foldmethod="expr"
      vim.opt.foldexpr="nvim_treesitter#foldexpr()"
      vim.opt.foldenable=false
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
})
-- vim:ts=2:sw=2:et:
