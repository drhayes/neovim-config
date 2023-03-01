return {
  {
    "giusgad/pets.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "edluffy/hologram.nvim" },
    config = function()
      require("pets").setup({
        default_style = "light_gray",
      })
    end,
  },
}
