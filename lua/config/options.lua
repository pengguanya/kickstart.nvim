-- >>> Diagnositc <<<
-- Do not show linter text
vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
--  vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- >>> NvimTree <<<
-- Auto close: https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
-- local function tab_win_closed(winnr)
--   local api = require"nvim-tree.api"
--   local tabnr = vim.api.nvim_win_get_tabpage(winnr)
--   local bufnr = vim.api.nvim_win_get_buf(winnr)
--   local buf_info = vim.fn.getbufinfo(bufnr)[1]
--   local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
--   local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
--   if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
--     -- Close all nvim tree on :q
--     if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
--       api.tree.close()
--     end
--   else                                                      -- else closed buffer was normal buffer
--     if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
--       local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
--       if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
--         vim.schedule(function ()
--           if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
--             vim.cmd "quit"                                        -- then close all of vim
--           else                                                  -- else there are more tabs open
--             vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
--           end
--         end)
--       end
--     end
--   end
-- end
local function tab_win_closed(winnr)
  local api = require"nvim-tree.api"
  local tabnr = vim.api.nvim_win_get_tabpage(winnr)
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local buf_info = vim.fn.getbufinfo(bufnr)[1]
  local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
  local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
  if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
    -- Close all nvim tree on :q
    if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
      api.tree.close()
    end
  else                                                      -- else closed buffer was normal buffer
    -- Check count of normal buffers (ignore NvimTree_)
    local normal_bufs = vim.tbl_filter(function(bufnr) 
      local buf_info = vim.fn.getbufinfo(bufnr)[1]
      return not buf_info.name:match(".*NvimTree_%d*$")
    end, tab_bufs)
    
    if #normal_bufs == 0 then                                 -- if there is no normal buffer left in the tab
      vim.schedule(function ()
          if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
            vim.cmd "quit"                                        -- then close all of vim
          else                                                  -- else there are more tabs open
            vim.api.nvim_win_close(tab_wins[1], true)            -- then close only the tab
          end
        end)
    end
  end
end

vim.api.nvim_create_autocmd("WinClosed", {
  callback = function ()
    local winnr = tonumber(vim.fn.expand("<amatch>"))
    vim.schedule_wrap(tab_win_closed(winnr))
  end,
  nested = true
})

-- For vim.fugitive GBrwose to open git url in browser
-- By default, it should be handled by netrw to invoke the browser
-- But nvim-tree disabled the netrw. To make it work, define a custom command Browse
-- that uses xdg-open command to open the argument url
vim.api.nvim_create_user_command(
  'Browse',
  function (opts)
    vim.fn.system { 'xdg-open', opts.fargs[1] }
  end,
  { nargs = 1 }
)
