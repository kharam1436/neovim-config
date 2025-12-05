-- lua/plugins/colorscheme.lua
return {
  "folke/tokyonight.nvim",
  priority = 1000, -- Load before other plugins
  config = function()
    require("tokyonight").setup({
      style = "storm", -- Options: storm, night, moon, day
    })
    vim.cmd.colorscheme("tokyonight-storm")
  end,
}
