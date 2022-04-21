require 'drhayes.options'
require 'drhayes.augroup'
require 'drhayes.plugins'

-- Do all our key mappings.
local keyMappings = require 'drhayes.keyMappings'
keyMappings.initKeymap()

local a = vim.api
a.nvim_exec([[
  if has ("autocmd")
    filetype plugin indent on
  endif
]], '')

a.nvim_command(':cabbrev h vert bo help')

-- we are done setting stuff up
a.nvim_command("silent! helptags ALL")

