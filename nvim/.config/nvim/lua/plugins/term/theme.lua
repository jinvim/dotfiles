return {
  -- themes
  {
    "sainnhe/gruvbox-material" ,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd.colorscheme("gruvbox-material")
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = "hard"

      local theme_config = vim.fn['gruvbox_material#get_configuration']()
      local colors = vim.fn['gruvbox_material#get_palette'](theme_config.background, theme_config.foreground, theme_config.colors_override)

      if theme_config.transparent_background == 2 then
        colors.bg1 = colors.none
      end

      vim.cmd.highlight("Normal", "guibg=None")
      vim.cmd.highlight("NormalNC", "guibg=None")
      vim.cmd.highlight("EndOfBuffer", "guibg=None")
      vim.cmd.highlight("NormalFloat", "guibg=None")
      vim.cmd.highlight("SignColumn", "guibg=None")
      vim.cmd.highlight("FoldColumn", "guibg=None")
      vim.cmd.highlight("LineNr", "guibg=None")
      vim.cmd.highlight("FloatBorder", "guibg=None")
      vim.cmd.highlight("WinBar", "guibg=None")
      vim.cmd.highlight("WinBarNC", "guibg=None")

      -- custom telescope colors
      vim.cmd.highlight("TelescopeNormal", "guibg=" .. colors.bg_dim[1])
      vim.cmd.highlight("TelescopePromptNormal", "guibg=" .. colors.bg1[1])
      vim.cmd.highlight("TelescopeResultsNormal", "guibg=" .. colors.bg_dim[1])
      vim.cmd.highlight("TelescopePreviewNormal", "guibg=" .. colors.bg_dim[1])
      vim.cmd.highlight("TelescopeBorder", "guibg=" .. colors.bg_dim[1])
      vim.cmd.highlight("TelescopePromptBorder", "guibg=" .. colors.bg1[1])
      vim.cmd.highlight("TelescopeResultsBorder", "guibg=" .. colors.bg_dim[1])
      vim.cmd.highlight("TelescopePreviewBorder", "guibg=" .. colors.bg_dim[1])
      vim.cmd.highlight("TelescopePromptTitle", "guifg=" .. colors.bg_dim[1], "guibg=" .. colors.red[1])
      vim.cmd.highlight("TelescopeResultsTitle", "guifg=" .. colors.bg_dim[1], "guibg=" .. colors.blue[1])
      vim.cmd.highlight("TelescopePreviewTitle", "guifg=" .. colors.bg_dim[1], "guibg=" .. colors.aqua[1])
      -- custom indent line colors
      vim.cmd.highlight("IndentLine", "guifg=" .. colors.bg1[1])
      vim.cmd.highlight("IndentLineCurrent", "guifg=" .. colors.grey0[1])
    end,
  },
  {"sainnhe/gruvbox-material"}, -- just in case...
}
