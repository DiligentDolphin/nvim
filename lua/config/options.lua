-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local function is_windows()
  return vim.fn.has("win64") or vim.fn.has("win32") or vim.fn.has("win16")
end

if is_windows() and vim.fn.executable("pwsh") then
  vim.o.shell = "pwsh"
end
