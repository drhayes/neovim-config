return {
  "zbirenbaum/copilot-cmp",
  dependencies = { "copilot.lua" },
  build = function()
    require("copilot_cmp").setup()
  end,
}
