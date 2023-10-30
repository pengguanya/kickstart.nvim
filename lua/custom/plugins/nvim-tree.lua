return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  }, -- optional, for file icons
  config = function()
    require('nvim-tree').setup({
       -- disable_netrw = false,     -- uncomment this line to enable netrw 
       -- hijack_netrw = true,       -- uncomment this line to enable netrw 
       sort_by = "case_sensitive",
       renderer = {
         group_empty = true,
       },
     })
    -- key-bindings
    vim.keymap.set('n', '<F4>', '<cmd>NvimTreeToggle<cr>')
  end,
}
