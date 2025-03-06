-- First things first, set the node path globally.
if vim.fn.has('unix') and vim.env.NEOVIM_NODE_VERSION then
  local node_dir = vim.env.HOME .. '/.asdf/installs/nodejs/' .. vim.env.NEOVIM_NODE_VERSION .. '/bin/'
  if vim.fn.isdirectory(node_dir) then
    vim.env.PATH = node_dir .. ':' .. vim.env.PATH
  end
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require('config.lazy')

local esc = vim.api.nvim_replace_termcodes('<ESC>', true, true, true)

vim.api.nvim_create_augroup('JSLogMacro', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = 'JSLogMacro',
  pattern = { 'javascript', 'typescript' },
  callback = function()
    vim.fn.setreg('l', "yoconsole.log('" .. esc .. "pa:', " .. esc .. 'pa);' .. esc)
  end,
})
