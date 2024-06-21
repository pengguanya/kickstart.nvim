-- options to be silent
local all_silent = { noremap = true, silent = true }

-- function to create keymap_options
local function keymap_options(description, ...)
  local options = { desc = description }
  local args = { ... }
  for _, arg in ipairs(args) do
    if type(arg) == "table" then
      for k, v in pairs(arg) do
        options[k] = v
      end
    end
  end
  return options
end

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
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', keymap_options('Next Buffer', all_silent))

-- Map Shift-Tab key to :bprev
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprev<CR>',keymap_options('Previous Buffer', all_silent))

-- Map Ctrl-w to close the current buffer
vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', keymap_options('Close current buffer', all_silent))

-- Map Ctrl-Shift-w to wipe out the current buffer
vim.api.nvim_set_keymap('n', '<C-S-w>', ':bw<CR>', keymap_options('Wipe out current buffer', all_silent))

-- Delete trailing spaces in every line
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>x', ':silent! %s/\\s\\+$//e<CR>', keymap_options('Delete all trailing spaces', all_silent))


-- [[ User defined functions ]] 
local utils = require("config.functions") 

-- Switch between camel and sanke case
vim.keymap.set('n', '<Leader>k', utils.switch_case, keymap_options('Switch word under cursor from CamMel to snake_case', all_silent))
