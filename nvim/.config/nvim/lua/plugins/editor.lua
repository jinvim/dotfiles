return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      options = {
        disable_filetype = { "TelescopePrompt", "vim" },
        check_ts = true,
      },
    },
  },
  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      require("leap").create_default_mappings()
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufRead",
    opts = {
      user_default_options = {
        AARRGGBB = true,
      },
    },
  },
  {
    "filipdutescu/renamer.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      title = "",
      border_chars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      empty = true,
    },
    keys = {
      {
        "<F2>",
        function()
          require("renamer").rename()
        end,
        desc = "rename",
      },
    },
  },
  { "echasnovski/mini.bracketed", opts = {} },
  { "echasnovski/mini.cursorword", opts = {} },
  { "echasnovski/mini.ai", opts = {} },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "ys",
        delete = "ds",
        find = "",
        find_left = "",
        highlight = "",
        replace = "cs",
        update_n_lines = "",
      },
    },
  },
  {
    "echasnovski/mini.move",
    opts = {
      mappings = {
        left = "<M-H>",
        right = "<M-L>",
        down = "<M-J>",
        up = "<M-K>",

        -- Move current line in Normal mode
        line_left = "<M-H>",
        line_right = "<M-L>",
        line_down = "<M-J>",
        line_up = "<M-K>",
      },
    },
  },
  {
    "echasnovski/mini.splitjoin",
    opts = { mappings = { toggle = "<leader>m" } },
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
  -- git
  {
    "lewis6991/gitsigns.nvim",
    event = "VimEnter",
    opts = {},
  },
}
