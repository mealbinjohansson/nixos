-------------
-- Keymaps --
-------------

vim.g.mapleader = " ";

-- Ease keymap setting
local map = vim.keymap.set

-- Specific keymaps
map("n", "<leader>o", ":update<CR>:source<CR>");     -- Source current lua file
map({ "n", "x" }, "<leader>lf", vim.lsp.buf.format); -- Format current buffer
map("n", "<leader>e", ":Explore<CR>");               -- Navigation
map("n", "<C-9>", "<C-]>")                           -- Re-map tag key binding to work on nordic keyboard layout

-- Remove arrow keymaps
map("", "<up>", "<nop>", { noremap = true })
map("", "<down>", "<nop>", { noremap = true })
map("", "<left>", "<nop>", { noremap = true })
map("", "<right>", "<nop>", { noremap = true })
map("i", "<up>", "<nop>", { noremap = true })
map("i", "<down>", "<nop>", { noremap = true })
map("i", "<left>", "<nop>", { noremap = true })
map("i", "<right>", "<nop>", { noremap = true })
