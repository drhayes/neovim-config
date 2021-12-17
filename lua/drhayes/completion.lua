local M = {}

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function feedkey(str, mode, escape_csi)
  return vim.api.nvim_feedkeys(t(str), mode, escape_csi)
end

-- local function check_backspace()
--     local col = vim.fn.col('.') - 1
--     return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
-- end

-- local is_emmet_active = function() return false end

local menuLookup = {
  nvim_lsp = "(LSP)",
  emoji = "(Emoji)",
  path = "(Path)",
  calc = "(Calc)",
  vsnip = "(Snippet)",
  buffer = "(Buffer)",
  spell = "(Spell)",
}

function M.setup()
  local cmp = require('cmp')
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')

  cmp.setup({
    formatting = {
      format = function(entry, vim_item)
        local icons = M.icons
        vim_item.kind = icons[vim_item.kind]
        vim_item.menu = menuLookup[entry.source.name]
        vim_item.dup = ({
          buffer = 1,
          path = 1,
          nvim_lsp = 0,
        })[entry.source.name] or 0
        return vim_item
      end,
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    documentation = {
      border = 'rounded',
    },
    sources = {
      { name = 'nvim_lua' },
      { name = 'vsnip' },
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'emoji' },
      { name = 'treesitter' },
      { name = 'crates' },
      { name = 'spell' },
      { name = 'path' },
      { name = 'calc' },
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({
        -- behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
    },
  })

  cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
end

M.icons = {
  Class = " ",
  Color = " ",
  Constant = "ﲀ ",
  Constructor = " ",
  Enum = "練",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = "",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = " ",
  Module = " ",
  Operator = "",
  Property = " ",
  Reference = " ",
  Snippet = " ",
  Struct = " ",
  Text = " ",
  TypeParameter = " ",
  Unit = "塞",
  Value = " ",
  Variable = " ",
}

return M

