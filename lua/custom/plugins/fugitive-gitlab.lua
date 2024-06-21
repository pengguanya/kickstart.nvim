return {
  "shumphrey/fugitive-gitlab.vim",
  dependencies = {
    "tpope/vim-fugitive"
  },
  config = function()
    vim.g.fugitive_gitlab_domains = { ['ssh.code.roche.com'] = 'https://code.roche.com' }
  end,
}
