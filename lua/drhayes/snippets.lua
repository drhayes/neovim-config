local ls = require 'luasnip'

-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

ls.snippets = {
  all = {},

  lua = {
    s('lreq', {
      t('local '),
      i(1, 'lume'),
      t([[ = require ']]),
      i(2, 'lib.lume'),
      t([[']]),
      i(0),
    }),

    s('f:', {
      t('function '),
      i(1, 'ClassName'),
      t(':'),
      i(2, 'methodName'),
      t('('),
      i(3, 'args'),
      t({')', ''}),
      t('  '),
      i(0),
      t({'', 'end'}),
    }),

    s('ld', {
      t('log.debug('),
      i(0),
      t(')'),
    }),

    s('ldi', {
      t('log.debug(inspect('),
      i(0),
      t('))'),
    }),
  }
}
