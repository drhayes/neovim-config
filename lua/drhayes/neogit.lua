local neogit = require 'neogit'

return {
  setup = function()
    neogit.setup({
      disable_signs = false,
      disable_context_highlighting = false,
      disable_commit_confirmation = true,
      signs = {
        -- { CLOSED, OPENED }
        section = { ">", "v" },
        item = { ">", "v" },
        hunk = { "", "" },
      },
      integrations = {
        diffview = true,
      },
      -- mappings = {},
    })
  end
}
