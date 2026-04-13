-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Explicit clipboard keymaps (clipboard=unnamedplus removed to avoid Windows lag)
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste from clipboard (before)" })
