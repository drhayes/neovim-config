-- As of 2025-10-22, this doesn't seem to be working:
-- Error executing Lua callback: ...cal/share/nvim/lazy/openingh.nvim/lua/openingh/utils.lua:218: attempt to concatenate local 'url' (a nil value)
-- stack traceback:
-- 	...cal/share/nvim/lazy/openingh.nvim/lua/openingh/utils.lua:218: in function 'open_url'
-- 	...ocal/share/nvim/lazy/openingh.nvim/lua/openingh/init.lua:98: in function 'open_url'
-- 	....local/share/nvim/lazy/openingh.nvim/plugin/openingh.lua:67: in function <....local/share/nvim/lazy/openingh.nvim/plugin/openingh.lua:63>
return {
  'almo7aya/openingh.nvim',
  keys = {
    { '<leader>gr', '<cmd>OpenInGHRepo <cr>', desc = 'Open in GitHub repo' },
    { '<leader>gR', '<cmd>OpenInGHFile <cr>', desc = 'Open in GitHub file' },
  },
}
