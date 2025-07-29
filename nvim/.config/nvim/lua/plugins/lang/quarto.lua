if vim.loop.os_uname().sysname == "Darwin" then
  return {
    {
      "jmbuhr/otter.nvim",
      opts = {
        buffers = {
          set_filetype = true,
          write_to_disk = true,
        },
      },
      ft = { "quarto" },
    },
    {
      "quarto-dev/quarto-nvim",
      cmd = { "QuartoActivate", "QuartoPreview" },
      dependencies = {
        "jmbuhr/otter.nvim",
        "nvim-treesitter/nvim-treesitter",
        "neovim/nvim-lspconfig",
      },
      opts = {
        codeRunner = {
          enabled = true,
          default_method = "iron",
          never_run = { "yaml" },
        },
      },
      ft = { "quarto" },
    },
    {
      "jmbuhr/telescope-zotero.nvim",
      dependencies = {
        {
          "kkharji/sqlite.lua",
          "nvim-telescope/telescope.nvim",
        },
      },
      opts = {},
      config = function(_, opts)
        require("zotero").setup(opts)
        local telescope = require("telescope")
        telescope.load_extension("zotero")
      end,
      ft = { "quarto" },
    },
  }
else
  return {}
end
