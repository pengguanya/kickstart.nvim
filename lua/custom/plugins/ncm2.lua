return {
  "ncm2/ncm2",
  dependencies = {
    "roxma/nvim-yarp"
  },
  config = function ()
    vim.cmd([[
      autocmd BufEnter * call ncm2#enable_for_buffer()
      set completeopt=noinsert,menuone,noselect
    ]])
  end,
  enabled = false
}
