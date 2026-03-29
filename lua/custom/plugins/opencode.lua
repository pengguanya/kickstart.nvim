return {
  'nickjvandyke/opencode.nvim',
  version = '*',
  dependencies = {
    {
      'folke/snacks.nvim',
      optional = true,
      opts = {
        input = {},
        picker = {
          actions = {
            opencode_send = function(...) return require('opencode').snacks_picker_send(...) end,
          },
          win = {
            input = {
              keys = {
                ['<a-a>'] = { 'opencode_send', mode = { 'n', 'i' } },
              },
            },
          },
        },
        terminal = {},
      },
    },
  },
  config = function()
    vim.o.autoread = true

    -- Keymaps using <leader>n prefix to avoid conflicts
    vim.keymap.set({ 'n', 'x' }, '<leader>na', function() require('opencode').ask('@this: ', { submit = true }) end, { desc = 'Ask opencode' })
    vim.keymap.set({ 'n', 'x' }, '<leader>ns', function() require('opencode').select() end, { desc = 'Select opencode action' })
    vim.keymap.set({ 'n', 't' }, '<leader>nn', function() require('opencode').toggle() end, { desc = 'Toggle opencode' })

    vim.keymap.set({ 'n', 'x' }, '<leader>np', function() return require('opencode').operator('@this ') end, { desc = 'Add range to opencode', expr = true })

    vim.keymap.set('n', '<leader>nu', function() require('opencode').command('session.half.page.up') end, { desc = 'Scroll opencode up' })
    vim.keymap.set('n', '<leader>nd', function() require('opencode').command('session.half.page.down') end, { desc = 'Scroll opencode down' })
  end,
}
