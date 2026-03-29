return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    { 'github/copilot.vim' },
    { 'nvim-lua/plenary.nvim' },
  },
  build = 'make tiktoken',
  opts = {
    model = 'claude-3.5-sonnet',
    window = {
      layout = 'vertical',
      width = 0.4,
    },
    mappings = {
      complete = {
        insert = '<Tab>',
      },
      close = {
        normal = 'q',
        insert = '<C-c>',
      },
      reset = {
        normal = '<C-l>',
        insert = '<C-l>',
      },
      submit_prompt = {
        normal = '<CR>',
        insert = '<C-CR>',
      },
      accept_diff = {
        normal = '<C-y>',
        insert = '<C-y>',
      },
    },
  },
  keys = {
    -- Toggle and UI
    { '<leader>aa', '<cmd>CopilotChatToggle<cr>', mode = { 'n', 'v' }, desc = 'Toggle chat window' },
    { '<leader>ap', '<cmd>CopilotChatPrompts<cr>', mode = { 'n', 'v' }, desc = 'Open prompts selector' },
    { '<leader>am', '<cmd>CopilotChatModels<cr>', mode = 'n', desc = 'Select AI model' },

    -- Quick question
    {
      '<leader>aq',
      function()
        local input = vim.fn.input 'Quick Chat: '
        if input ~= '' then
          require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer })
        end
      end,
      mode = 'n',
      desc = 'Quick question (buffer)',
    },
    {
      '<leader>aq',
      function()
        local input = vim.fn.input 'Quick Chat: '
        if input ~= '' then
          require('CopilotChat').ask(input, { selection = require('CopilotChat.select').visual })
        end
      end,
      mode = 'v',
      desc = 'Quick question (selection)',
    },

    -- Code actions
    { '<leader>ae', '<cmd>CopilotChatExplain<cr>', mode = { 'n', 'v' }, desc = 'Explain code' },
    { '<leader>ar', '<cmd>CopilotChatReview<cr>', mode = { 'n', 'v' }, desc = 'Review code' },
    { '<leader>af', '<cmd>CopilotChatFix<cr>', mode = { 'n', 'v' }, desc = 'Fix code issues' },
    { '<leader>ad', '<cmd>CopilotChatDocs<cr>', mode = { 'n', 'v' }, desc = 'Generate documentation' },
    { '<leader>at', '<cmd>CopilotChatTests<cr>', mode = { 'n', 'v' }, desc = 'Generate tests' },
    { '<leader>ao', '<cmd>CopilotChatOptimize<cr>', mode = { 'n', 'v' }, desc = 'Optimize code' },

    -- Git
    { '<leader>ac', '<cmd>CopilotChatCommit<cr>', mode = 'n', desc = 'Generate commit message' },
  },
}
