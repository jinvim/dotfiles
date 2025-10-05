return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("marksman", {
        filetypes = { "markdown", "quarto" },
      })
      vim.lsp.config("vale_ls", {
        filetypes = { "markdown", "quarto", "text" },
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      {
        "mason-org/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        opts = {
          ensure_installed = {
            "stylua",
            "shfmt",
          },
        },
      },
      "neovim/nvim-lspconfig",
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
