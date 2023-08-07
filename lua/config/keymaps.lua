-- Copy to clipboard in all mode
vim.keymap.set({"n", "v"}, "<leader>y",'"+y')

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- additional telescope keymap (default ones already in init.lua)
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })

-- Map Tab key to :bnext
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true, desc = 'Next Buffer' })

-- Map Shift-Tab key to :bprev
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprev<CR>', { noremap = true, silent = true, desc = 'Previous Buffer' })

-- Map Ctrl-w to close the current buffer
vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', { noremap = true, silent = true, desc = 'Close current buffer'})

-- Map Ctrl-Shift-w to wipe out the current buffer
vim.api.nvim_set_keymap('n', '<C-S-w>', ':bw<CR>', { noremap = true, silent = true, desc= 'Wipe out current buffer' })
