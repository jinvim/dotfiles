return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.marksman.setup({
        filetypes = { "markdown", "quarto" },
      })
      lspconfig.vale_ls.setup({
        filetypes = { "markdown", "quarto", "text" },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "mystylua" },
        python = { "isort", "black" },
        quarto = { "injected" },
        r = { lsp_format = "fallback" },
      },
      formatters = {
        mystylua = {
          command = "stylua",
          args = { "--indent-type", "Spaces", "--indent-width", "2", "-" },
        },
      },
    },
    keys = {
      {
        "<leader>p",
        function()
          require("conform").format()
        end,
        desc = "format",
      },
    },
  },
}
