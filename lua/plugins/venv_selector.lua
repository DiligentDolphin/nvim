return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python", --optional
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  lazy = false,
  branch = "regexp", -- This is the regexp branch, use this for the new version
  opts = {
    settings = {
      search = {
        -- configure: custom conda envs directory on office laptop
        conda_ol = { command = "fd python\\.exe d:\\\\conda\\\\envs" },
        cond = vim.uv.os_uname().sysname == "Windows_NT" and vim.fn.isdirectory("d:\\\\conda\\\\envs"),
      },
    },
  },
}
