return {
  -- themes
  {
    "sainnhe/gruvbox-material" ,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd.colorscheme("gruvbox-material")
      vim.cmd.highlight("Normal guibg=None")
      vim.cmd.highlight("NormalNC guibg=None")
      vim.cmd.highlight("EndOfBuffer guibg=None")
      vim.cmd.highlight("NormalFloat guibg=None")
      vim.cmd.highlight("SignColumn guibg=None")
      vim.cmd.highlight("FoldColumn guibg=None")
      vim.cmd.highlight("LineNr guibg=None")
      vim.cmd.highlight("FloatBorder guibg=None")
      vim.cmd.highlight("WinBar guibg=None")
      vim.cmd.highlight("WinBarNC guibg=None")

      -- custom telescope colors
      vim.cmd.highlight("TelescopeNormal guibg=#141617")
      vim.cmd.highlight("TelescopePromptNormal guibg=#32302f")
      vim.cmd.highlight("TelescopeResultsNormal guibg=#141617")
      vim.cmd.highlight("TelescopePreviewNormal guibg=#141617")
      vim.cmd.highlight("TelescopeBorder guibg=#141617")
      vim.cmd.highlight("TelescopePromptBorder guibg=#32302f")
      vim.cmd.highlight("TelescopeResultsBorder guibg=#141617")
      vim.cmd.highlight("TelescopePreviewBorder guibg=#141617")
      vim.cmd.highlight("TelescopePromptTitle guifg=#141617 guibg=#ea6962")
      vim.cmd.highlight("TelescopeResultsTitle guifg=#141617 guibg=#7daea3")
      vim.cmd.highlight("TelescopePreviewTitle guifg=#141617 guibg=#a9b665")
    end,
  },
}
