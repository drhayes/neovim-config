local keyMappings = {}

local function bufferMaps()
  return {
    name = "+buffer",
    b = { ':e#<CR>', "Last Buffer"},
    d = { '<Cmd>BufferLineSortByDirectory<CR>', "Order by Dir" },
    g = { "<cmd>BufferLinePick<cr>", "Goto Buffer" },
    l = { '<Cmd>BufferLineSortByDirectory<CR>', "Order by Lang" },
    n = { "<Cmd>BufferLineCycleNext<CR>", "Next Buffer" },
    p = { "<Cmd>BufferLineCyclePrev<CR>", "Previous Buffer" },
    s = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
  }
end

local function fileMaps()
  return {
    name = '+file',
    f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find Files" },
    g = { "<cmd>lua require('telescope.builtin').git_files()<CR>", "Find Git Files" },
    n = { "<cmd>enew<CR>", "New File" },
    r = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", "Recent Files" },
    s = { ":SymbolsOutline<CR>", "Symbols" },
    t = { "<cmd>NvimTreeToggle<cr>", "NvimTree" },
  }
end

local function gitMaps()
  return {
    name = "+git",
    b = { "<Cmd>Telescope git_branches<CR>", "branches" },
    c = { "<Cmd>Telescope git_commits<CR>", "commits" },
    d = { "<cmd>DiffviewOpen<cr>", "DiffView" },
    g = { "<cmd>lua require('neogit').open()<cr>", "Neogit" },
    h = { name = "+hunk" },
    i = { "<cmd>lua require('telescope').extensions.gh.issues()<CR>", "issues" },
    p = { "<cmd>lua require('telescope').extensions.gh.pull_request()<CR>", "pull requests" },
    s = { "<Cmd>Telescope git_status<CR>", "status" },
    w = { ":Gwrite<cr>", "Git Write" },
  }
end

local function searchMaps()
  return {
    name = "+search",
    c = { '<cmd>let @/=""<cr>', "Clear search highlight" },
    g = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Grep" },
    l = { "<cmd>lua require('telescope.builtin').loclist()<CR>", "Loclist" },
    q = { "<cmd>lua require('telescope.builtin').quickfix()<CR>","Quickfix" },
    s = { "<cmd>lua require('telescope.builtin').spell_suggest()<CR>", "Spelling" },
  }
end

function keyMappings.initKeymap()
  local wk = require 'which-key'

  wk.register({
    b = bufferMaps(),
    f = fileMaps(),
    g = gitMaps(),
    s = searchMaps(),
  }, { prefix = '<leader>' })
end

return keyMappings


