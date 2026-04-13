-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Disable automatic clipboard sync to avoid Windows lag on delete/change ops.
-- LazyVim sets clipboard=unnamedplus by default, so we explicitly override it.
-- Use "+y / "+p to copy/paste to system clipboard manually.
vim.opt.clipboard = ""
vim.opt.number = true
vim.opt.relativenumber = true
