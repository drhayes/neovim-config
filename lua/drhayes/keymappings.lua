local normalKeys = {
  ['<leader>d'] = { '"_d', 'Delete without overwrite' },
  ['<leader><space>'] = { '<cmd>Telescope oldfiles<cr>', 'Recently opened files' },
  ['<leader>/'] = { '<cmd>Telescope current_buffer_fuzzy_find<cr>', 'Fuzzy search in current buffer' },
  ['<leader>z'] = { ":redir @*> | echon join([expand('%'),  line('.')], ':') | redir END<CR>", 'Current relative filename in clipboard' },
  ['[d'] = { vim.diagnostic.goto_prev, 'Diagnostics previous' },
  [']d'] = { vim.diagnostic.goto_next, 'Diagnostics next' },
  f = { "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>" },
  F = { "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>" },
  K = { '<cmd>lua vim.lsp.buf.hover()<cr>' },
  -- Yank to the end of the line.
  Y = { 'yg$', 'Yank to EOL' },
  -- When going through search results, center the tab/window/buffer/thing.
  n = { 'nzzzv', 'Next then center' },
  -- Do the same thing as above, but for backwards.
  N = { 'Nzzzv', 'Prev then center' },
  -- When going to a line, center the tab/window/buffer/thing.
  G = { 'Gzz', 'Go then center' },
  -- Keep my cursor where it is when joining the next line.
  J = { 'mzJ`z', 'Join in place' },
  -- Keep centered when paging up and down.
  ['<C-d>'] = { '<C-d>zz', 'Down then center' },
  ['<C-u>'] = { '<C-u>zz', 'Up then center' },
  -- Harpoon.
  ["<C-h>"] = { '<cmd>lua require("harpoon.mark").add_file()<CR>' },
  ["<C-j>"] = { '<cmd>lua require("harpoon.ui").nav_file(1)<CR>' },
  ["<C-k>"] = { '<cmd>lua require("harpoon.ui").nav_file(2)<CR>' },
  ["<C-l>"] = { '<cmd>lua require("harpoon.ui").nav_file(3)<CR>' },
  ["<C-;>"] = { '<cmd>lua require("harpoon.ui").nav_file(4)<CR>' },
  ["<C-n>"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>' },
}

local visualKeys = {
  -- Paste in visual mode without overwriting register
  ['<leader>r'] = { '"_dP', 'Paste without overwrite' },
  -- Delete without overwriting register.
  ['<leader>d'] = { '"_d', 'Delete without overwrite' },
  -- Move visually selected blocks of text.
  J = { ":m '>+1<CR>gv=gv", 'Move selected down' },
  K = { ":m '<-2<CR>gv=gv", 'Move selected up' },
}

local lspKeys = {
  l = {
    name = '+LSP',
    r = { vim.lsp.buf.rename, 'Rename' },
    a = { vim.lsp.buf.code_action, 'Code action' },
    d = { vim.lsp.buf.type_definition, 'Type definition' },
    s = { require('telescope.builtin').lsp_document_symbols, 'Document symbols' },
    S = { require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace symbols' },
  },
}

return {
  whichKeyRegistrations = {
    b = {
      name = '+Buffer',
      b = { ':e#<CR>', "Last Buffer" },
      d = { '<Cmd>BufferLineSortByDirectory<CR>', "Order by Dir" },
      f = { '<Cmd>Telescope current_buffer_fuzzy_find<CR>', 'Fuzzy find in current buffer' },
      g = { "<cmd>BufferLinePick<cr>", "Goto Buffer" },
      l = { '<Cmd>BufferLineSortByDirectory<CR>', "Order by Lang" },
      n = { "<Cmd>BufferLineCycleNext<CR>", "Next Buffer" },
      p = { "<Cmd>BufferLineCyclePrev<CR>", "Previous Buffer" },
      s = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
    },

    d = {
      name = '+Diagnostics',
      f = { vim.diagnostic.open_float, 'Open float' },
      n = { vim.diagnostic.goto_next, 'Goto next' },
      p = { vim.diagnostic.goto_prev, 'Goto prev' },
      q = { vim.diagnostic.setloclist, 'Add diagnostics to loclist' },
    },

    g = {
      name = '+Goto',
      d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Goto Definition' },
      s = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help' },
      I = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Goto Implementation' },
      t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Goto Type Definition' },
      k = { '<Cmd>lua vim.lsp.buf.hover()<CR>', 'Lsp Hoverdoc' },
      w = { '<cmd>HopWord<CR>', 'Hop to word' },
      ['1'] = { '<cmd>HopChar1<CR>', 'Hop to single character' },
      r = { '<cmd>OpenInGHRepo<CR>', 'Open the GitHub repo for this file' },
      l = { '<cmd>OpenInGHFile<CR>', 'Open this file on GitHub at this line' },
      D = { '<cmd>Glance definitions<CR>', 'Glance LSP definitions' },
      R = { '<cmd>Glance references<CR>', 'Glance LSP references' },
      Y = { '<cmd>Glance type_definitions<CR>', 'Glance LSP type definitions' },
      M = { '<cmd>Glance implementations<CR>', 'Glance LSP implementations' },
    },

    t = {
      name = '+Trouble',
      d = { '<cmd>Trouble document_diagnostics<cr>', 'Diagnostics' },
      f = { '<cmd>Trouble lsp_definitions<cr>', 'Definitions' },
      l = { '<cmd>Trouble loclist<cr>', 'LocationList' },
      q = { '<cmd>Trouble quickfix<cr>', 'QuickFix' },
      r = { '<cmd>Trouble lsp_references<cr>', 'References' },
      w = { '<cmd>Trouble workspace_diagnostics<cr>', 'Workspace Diagnostics' },
    },

    s = {
      name = '+Searching',
      b = { '<cmd>Telescope buffers<cr>', '[B]uffers' },
      d = { '<cmd>Telescope diagnostics<cr>', '[D]iagnostics' },
      f = { '<cmd>Telescope find_files<cr>', '[F]iles' },
      g = { '<cmd>Telescope live_grep<cr>', '[G]rep' },
      h = { '<cmd>Telescope help_tags<cr>', '[H]elp' },
      k = { '<cmd>Telescope keymaps<cr>', '[K]eymaps' },
      m = { '<cmd>Telescope harpoon marks<cr>', 'Harpoon [M]arks' },
      n = { '<cmd>Telescope notify<cr>', '[N]otify' },
      r = { '<cmd>Telescope lsp_references<cr>', 'LSP [R]eferences' },
      w = { '<cmd>Telescope grep_string<cr>', 'Current [W]ord' },
    },
  },

  setup = function(set)
    for k, cmd in pairs(normalKeys) do
      set('n', k, cmd[1], { desc = cmd[2] })
    end

    for k, cmd in pairs(visualKeys) do
      set('v', k, cmd[1], { desc = cmd[2] })
    end

    -- Word-wrap aware up/down.
    vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
    vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
  end,

  onLspAttach = function(_, bufferNumber)
    local wk = require('which-key')
    wk.register(lspKeys, {
      buffer = bufferNumber,
      prefix = '<leader>',
    })

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation', buffer = bufferNumber })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Hover documentation', buffer = bufferNumber })

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufferNumber, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })  end,
}
