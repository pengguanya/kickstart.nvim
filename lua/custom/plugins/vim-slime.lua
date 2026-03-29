return {
  'jpalardy/vim-slime',
  config = function()
    -- Auto-detect: use tmux if inside tmux, otherwise neovim terminal
    if vim.env.TMUX then
      vim.g.slime_target = 'tmux'
      vim.g.slime_default_config = { socket_name = 'default', target_pane = '{next}' }
      vim.g.slime_dont_ask_default = 1
    else
      vim.g.slime_target = 'neovim'
      vim.g.slime_dont_ask_default = 0
    end

    -- Required config for neovim target
    vim.g.slime_neovim_ignore_unlisted = 0
    vim.g.slime_menu_config = 0
    vim.g.slime_input_pid = 0

    -- Keymaps to switch target on the fly
    vim.keymap.set('n', '<leader>st', function()
      vim.g.slime_target = 'tmux'
      vim.g.slime_default_config = { socket_name = 'default', target_pane = '{next}' }
      vim.notify('Slime target: tmux', vim.log.levels.INFO)
    end, { desc = 'Slime: use tmux' })

    vim.keymap.set('n', '<leader>sn', function()
      vim.g.slime_target = 'neovim'
      vim.b.slime_config = nil -- Clear buffer config to prompt for job ID
      vim.notify('Slime target: neovim terminal', vim.log.levels.INFO)
    end, { desc = 'Slime: use neovim terminal' })
  end,
}
