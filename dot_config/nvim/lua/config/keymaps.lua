vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
vim.keymap.set("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus File Explorer" })
vim.keymap.set("n", "<leader>h", vim.diagnostic.open_float, { desc = "Show diagnostic under cursor" })
