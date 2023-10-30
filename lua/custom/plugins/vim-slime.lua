return { 
  'jpalardy/vim-slime',
  -- Config for vim-slime
  config = function()
    vim.g.slime_target = 'tmux'
--    vim.g.slime_default_config = { socket_name = 'tvim_socket', target_pane = ':0.1' } -- To use tvim_socket for tvim
      vim.g.slime_default_config = { socket_name = "default", target_pane = "{next}" } -- general setup
      vim.g.slime_dont_ask_default = 1
  end,
}
