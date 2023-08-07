return { 
  'jpalardy/vim-slime',
  -- Config for vim-slime
  config = function()
    vim.g.slime_target = 'tmux'
    vim.g.slime_default_config = { socket_name = 'tvim_socket', target_pane = ':0.1' }
    vim.g.slime_dont_ask_default = 1
  end,
}
