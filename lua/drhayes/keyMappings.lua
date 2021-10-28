
local keyMappings = {}

local function fileMaps()
  return {
    name = '+file',
    t = { "<cmd>NvimTreeToggle<cr>", "NvimTree" },
    s = { ":SymbolsOutline<CR>", "Symbols" },
    f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find Files" },
    g = { "<cmd>lua require('telescope.builtin').git_files()<CR>", "Find Git Files" },
    r = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", "Recent Files" },
    n = { "<cmd>enew<CR>", "New File" },
  }
end

local function gitMaps()
  return {
    name = "+git",
    g = { "<cmd>lua require('neogit').open()<cr>", "Neogit" },
    w = { ":Gwrite<cr>", "Git Write" },
    c = { "<Cmd>Telescope git_commits<CR>", "commits" },
    b = { "<Cmd>Telescope git_branches<CR>", "branches" },
    s = { "<Cmd>Telescope git_status<CR>", "status" },
    d = { "<cmd>DiffviewOpen<cr>", "DiffView" },
    h = { name = "+hunk" },
    i = { "<cmd>lua require('telescope').extensions.gh.issues()<CR>", "issues" },
    p = { "<cmd>lua require('telescope').extensions.gh.pull_request()<CR>", "pull requests" },
  }
end

function keyMappings.initKeymap()
  local wk = require 'which-key'

  wk.register({
    f = fileMaps(),
    g = gitMaps(),
  }, { prefix = '<leader>' })
end

return keyMappings


