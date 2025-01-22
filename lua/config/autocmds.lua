-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local definitions = {
  {
    { 'BufEnter', 'CmdlineLeave', 'FocusGained', 'InsertLeave', 'WinEnter' },
    '*',
    [[if &number | setlocal relativenumber | endif]],
    'conditionally toggle relative line numbers (for pairing)',
  },

  {
    { 'BufLeave', 'CmdlineEnter', 'FocusLost', 'InsertEnter', 'WinLeave' },
    '*',
    [[if &number | setlocal norelativenumber | endif]],
    'conditionally toggle relative line numbers (for pairing)',
  },

  {
    { 'BufNewFile', 'BufRead' },
    '*.norg',
    [[ setlocal linebreak | setlocal textwidth=120 | setlocal formatexpr=nil ]],
    'Norg files wrap text at 120 characters and set formatexpr to nil.',
  },
}

for _, def in ipairs(definitions) do
  vim.api.nvim_create_autocmd(def[1], {
    pattern = def[2],
    command = def[3],
    desc = def[4],
  })
end

local epiquery_templates_dir = vim.fn.expand('~') .. '/src/glg/epiquery-templates/'

-- Create an autocommand group
vim.api.nvim_create_augroup('MustacheToSQL', { clear = true })

-- Create an autocommand
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'MustacheToSQL',
  pattern = '*.mustache',
  callback = function()
    local current_file = vim.fn.expand('%:p')
    if string.find(current_file, epiquery_templates_dir, 1, true) then
      vim.bo.filetype = 'sql'
    end
  end,
})
