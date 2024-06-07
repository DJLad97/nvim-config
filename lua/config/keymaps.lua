-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Move line up and down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

vim.keymap.set("v", "p", '"_dP')

-- Live grep .php files
vim.api.nvim_set_keymap('n', '<leader>sgp', "<cmd>lua require('telescope.builtin').live_grep({ glob_pattern = '*.php' })<CR>",
    { noremap = true, silent = true, desc = "Search in Vue files" }
)

-- Live grep .vue files
vim.api.nvim_set_keymap('n', '<leader>sgv', "<cmd>lua require('telescope.builtin').live_grep({ glob_pattern = '*.vue' })<CR>",
    { noremap = true, silent = true, desc = "Search in Vue files" }
)

-- Live grep .vue files
vim.api.nvim_set_keymap('n', '<leader>sgg', "<cmd>lua require('telescope.builtin').live_grep()<CR>",
    { noremap = true, silent = true, desc = "Search in all files" }
)

