require('Comment').setup()

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

-- Define the function to comment a line a certain number of lines relative to current cursor position

-- Define the function to comment a line a certain number of lines relative to the current cursor position
-- Define a table to store cursor positions
local cursor_positions = {}

-- Define the function to comment a line a certain number of lines relative to current cursor position
function CommentRelative(direction, lines)
  -- Store current cursor position
  local current_pos = vim.fn.getpos('.')
  table.insert(cursor_positions, current_pos)
  
  -- Calculate the movement direction
  local move_cmd = direction == 'up' and 'k' or 'j'
  
  -- Move 'lines' lines in the specified direction
  vim.cmd('normal! ' .. lines .. move_cmd)
  
  -- Use Comment.nvim to comment the current line
  require('Comment.api').toggle.linewise.current()
  
  -- Jump back to the stored cursor position
  local last_pos = table.remove(cursor_positions)
  vim.fn.setpos('.', last_pos)
end

-- Create a mapping to call the function with a user-specified direction and number of lines
vim.api.nvim_set_keymap('n', '<leader>ck', ':lua CommentRelative("up", vim.fn.input("Number of lines above to comment: "))<CR>', { noremap = true, silent = true, desc ='Comment nth line above current cursor' })
vim.api.nvim_set_keymap('n', '<leader>cj', ':lua CommentRelative("down", vim.fn.input("Number of lines below to comment: "))<CR>', { noremap = true, silent = true, desc ='Comment nth line below current cursor' })
