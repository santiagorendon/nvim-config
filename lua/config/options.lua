-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Defer clipboard setup to avoid blocking delete/yank ops on Windows
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)
vim.opt.number = true
vim.opt.relativenumber = true
