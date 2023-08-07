return {
  "windwp/nvim-autopairs",
  -- Config for nvim-autoparis
  config = function()
    require('nvim-autopairs').setup({
      enable_check_bracket_line = false,
      ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol,
      -- put this to setup function and press <a-e> to use fast_wrap
      fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
      },
      -- add option map_cr
      map_cr = true,
    })
  end,
}

