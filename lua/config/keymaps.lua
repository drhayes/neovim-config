-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local function map(mode, lhs, rhs, opts)
  local keys = require('lazy.core.handler').handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- My god, vertical split help.
-- vim.keymap.set('c', 'help', 'vert help')

-- Move blocks when visually selected.
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- Center after move.
map('n', 'n', 'nzzzv', { desc = 'Next then center' })
map('n', 'N', 'Nzzzv', { desc = 'Prev then center' })
map('n', 'G', 'Gzz', { desc = 'Go then center' })

-- vim.keymap.del('n', '<C-h>')
-- vim.keymap.del('n', '<C-j>')
-- vim.keymap.del('n', '<C-k>')
-- vim.keymap.del('n', '<C-l>')

-- From: https://github.com/ibhagwan/fzf-lua/issues/1262
-- Allow <C-R>w to get current word under cursor for fzf-lua.
-- vim.keymap.set({ "n", "x" }, "<C-l>",
--   function()
--     vim.fn.setreg("w", vim.fn.expand("<cword>"))
--     require('fzf-lua').live_grep({
--       winopts = {
--         on_create = function()
--           local b = vim.api.nvim_get_current_buf()
--           vim.keymap.set(
--             "t", "<C-r>", [['<C-\><C-N>"'.nr2char(getchar()).'pi']],
--             { buffer = b, expr = true }
--           )
--         end
--       }
--     })
--   end,
--   { silent = true, desc = "FzfLua live_grep" }
-- )
