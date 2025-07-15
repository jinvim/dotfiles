return {
  -- core
  "nvim-lua/plenary.nvim",
  {
    import = "plugins.term",
    cond = function()
      return not vim.g.vscode
    end,
  },
  -- for language specific
  {
    import = "plugins.lang",
    cond = function()
      return not vim.g.vscode
    end,
  },
}
