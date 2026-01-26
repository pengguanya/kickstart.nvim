-- >>> Diagnositc <<<
-- Do not show linter text
vim.diagnostic.config({
  virtual_text = false
})

-- For vim.fugitive GBrowse to open git url in browser
-- By default, it should be handled by netrw to invoke the browser
-- But netrw is disabled (for neo-tree). To make it work, define a custom command Browse
-- that uses xdg-open command to open the argument url
vim.api.nvim_create_user_command(
  'Browse',
  function (opts)
    vim.fn.system { 'xdg-open', opts.fargs[1] }
  end,
  { nargs = 1 }
)
