return {
  -- themes
  {
    "RRethy/base16-nvim" ,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd.colorscheme("base16-black-metal-khold")
      vim.cmd.highlight("Normal guibg=None ctermbg=None")
      vim.cmd.highlight("NormalNC guibg=None ctermbg=None")
      vim.cmd.highlight("EndOfBuffer guibg=None ctermbg=None")
      vim.cmd.highlight("NormalFloat guibg=None ctermbg=None")
      vim.cmd.highlight("NvimTreeNormal guibg=None ctermbg=None")
      vim.cmd.highlight("NvimTreeNormal guibg=None ctermbg=None")
      vim.cmd.highlight("SignColumn guibg=None ctermbg=None")
      vim.cmd.highlight("FoldColumn guibg=None ctermbg=None")
      vim.cmd.highlight("LineNr guibg=None ctermbg=None")
      vim.cmd.highlight("FloatBorder guibg=None ctermbg=None")
    end,
  },
}
