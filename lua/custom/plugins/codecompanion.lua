return {
  'olimorris/CodeCompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'lalitmee/codecompanion-spinners.nvim',
  },
  opts = {
    strategies = {
      chat = {
        adapter = 'copilot',
        keymaps = {
          send = {
            modes = { n = '<CR>', i = '<C-CR>' },
          },
          close = {
            modes = { n = 'q' },
          },
        },
      },
      inline = {
        adapter = 'copilot',
      },
      agent = {
        adapter = 'copilot',
      },
    },
    display = {
      chat = {
        window = {
          layout = 'vertical',
          width = 0.4,
          position = 'right',
        },
      },
    },
    extensions = {
      spinner = {
        opts = {
          style = 'cursor-relative',
        },
      },
    },
  },
  keys = {
    { '<leader>oo', '<cmd>CodeCompanionChat Toggle<cr>', mode = { 'n', 'v' }, desc = 'Toggle chat window' },
    { '<leader>oa', '<cmd>CodeCompanionActions<cr>', mode = { 'n', 'v' }, desc = 'Action palette' },
    { '<leader>oi', '<cmd>CodeCompanion<cr>', mode = { 'n', 'v' }, desc = 'Inline assistant' },
    { '<leader>op', '<cmd>CodeCompanionChat Add<cr>', mode = 'v', desc = 'Add selection to chat' },
  },
  init = function()
    vim.cmd [[cab cc CodeCompanion]]
  end,
}
