local keyMappings = {}

local bufferMaps =  {
  name = "+buffer",
  b = { ':e#<CR>', "Last Buffer"},
  d = { '<Cmd>BufferLineSortByDirectory<CR>', "Order by Dir" },
  f = { '<Cmd>Telescope current_buffer_fuzzy_find<CR>', 'Fuzzy find in current buffer' },
  g = { "<cmd>BufferLinePick<cr>", "Goto Buffer" },
  l = { '<Cmd>BufferLineSortByDirectory<CR>', "Order by Lang" },
  n = { "<Cmd>BufferLineCycleNext<CR>", "Next Buffer" },
  p = { "<Cmd>BufferLineCyclePrev<CR>", "Previous Buffer" },
  s = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
}

local fileMaps = {
  name = '+file',
  f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find Files" },
  g = { "<cmd>lua require('telescope.builtin').git_files()<CR>", "Find Git Files" },
  n = { "<cmd>enew<CR>", "New File" },
  r = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", "Recent Files" },
  -- s = { ":SymbolsOutline<CR>", "Symbols" },
  -- t = { "<cmd>NvimTreeToggle<cr>", "NvimTree" },
}

local searchMaps = {
  name = "+search",
  c = { '<cmd>let @/=""<cr>', "Clear search highlight" },
  g = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Grep" },
  l = { "<cmd>lua require('telescope.builtin').loclist()<CR>", "Loclist" },
  q = { "<cmd>lua require('telescope.builtin').quickfix()<CR>","Quickfix" },
  r = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "Document Symbols" },
  s = { "<cmd>lua require('telescope.builtin').spell_suggest()<CR>", "Spelling" },
  -- a = { ':Ag<cr>', 'Silver Searcher' },
}

local gotoKeymap = {
  name = '+goto',
  r = { '<cmd>Telescope lsp_references<cr>', 'References' },
  R = { '<cmd>LspTrouble lsp_references<cr>', 'Trouble References' },
  D = { '<cmd>lua require"lspsaga.provider".preview_definition()<CR>', 'Peek Definition' },
  d = { '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Goto Definition' },
  s = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help' },
  I = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Goto Implementation' },
  -- I = { '<Cmd>lua vim.lsp.buf.declaration()<CR>', 'Goto Declaration' },
  t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Goto Type Definition' },
  k = { '<Cmd>lua vim.lsp.buf.hover()<CR>', 'Lsp Hoverdoc' },
  h = { '<cmd>lua require"lspsaga.provider".lsp_finder()<CR>', 'Lsp Finder' },
  w = { '<cmd>HopWord<CR>', 'Hop to word' },
  ['1'] = { '<cmd>HopChar1<CR>', 'Hop to single character' },
}

function keyMappings.initKeymap()
  local wk = require 'which-key'

  wk.register({
    b = bufferMaps,
    f = fileMaps,
    s = searchMaps,
  }, { prefix = '<leader>' })

  vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
  vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
  vim.api.nvim_set_keymap('', '<C-P>', "<cmd>lua require('telescope.builtin').git_files()<CR>", {})
end

function keyMappings.lsp_setup(client, bufnr)
  local wk = require 'which-key'

  local opts = { noremap = true, silent = true, buffer = bufnr}

  local codeKeymap = {
    c = {
      name = "+code",
      ["r"] = { "<cmd>lua require('lspsaga.rename').rename()<CR>", "Rename" },
      ["a"] = { "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", "Code Action" },
      ["d"] = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false,border='rounded'})<CR>", "Line Diagnostics"},
      ["l"] = {
        name = "+lsp",
        i = { "<cmd>LspInfo<cr>", "Lsp Info" },
        a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Folder" },
        r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Folder" },
        l = {
          "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
          "List Folders"
        }
      }
    },
    x = {
      s = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Search Document Diagnostics" },
      W = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" }
    }
  }

  if client.name == "typescript" then
    codeKeymap.c.o = { "<cmd>:TSLspOrganize<CR>", "Organize Imports" }
    codeKeymap.c.R = { "<cmd>:TSLspRenameFile<CR>", "Rename File" }
  end

  local codeKeymapVisual = {
    c = {
      name = "+code",
      a = { ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", "Code Action" }
    }
  }

  local function map(mode, key, result, opts)
    local map_opts = {
      noremap = true,
      silent = opts.silent or false,
      expr = opts.expr or false,
      script = opts.script or false
    }
    if not opts.buffer then
      vim.api.nvim_set_keymap(mode, key, result, map_opts)
    else
      local buffer = opts.buffer
      if buffer == true then
        buffer = 0
      end
      vim.api.nvim_buf_set_keymap(buffer, mode, key, result, map_opts)
    end
  end

  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts={focusable=false,border='rounded'}})<CR>", opts)
  map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts={focusable=false,border='rounded'}})<CR>", opts)

  -- Yank to the end of the line.
  map('n', 'Y', 'yg$', opts)
  -- When going through search results, center the tab/window/buffer/thing.
  map('n', 'n', 'nzzzv', opts)
  -- Do the same thing as above, but for backwards.
  map('n', 'N', 'Nzzzv', opts)
  -- Keep my cursor where it is when joining the next line.
  map('n', 'J', 'mzJ`z', opts)
  -- The next two move blocks around in visual block mode.
  map('v', 'J', ":m '>+1<CR>gv=gv", opts)
  map('v', 'K', ":m '<-2<CR>gv=gv", opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    codeKeymap.c.f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" }
  elseif client.resolved_capabilities.document_range_formatting then
    codeKeymapVisual.c.f = { "<cmd>lua vim.lsp.buf.range_formatting()<CR>", "Format Range" }
  end

  wk.register(codeKeymap, { buffer = bufnr, prefix = "<leader>" })
  wk.register(codeKeymapVisual, { buffer = bufnr, prefix = "<leader>", mode = "v" })
  wk.register(gotoKeymap, { buffer = bufnr, prefix = "g" })
end

return keyMappings


