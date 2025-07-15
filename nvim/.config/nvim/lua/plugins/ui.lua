return {
  -- icons
  "kyazdani42/nvim-web-devicons",
  -- status line
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = true,
        section_separators = "",
        component_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "diagnostics", "diff" },
        lualine_x = {
          {
            "lsp_status",
            icon = "󰈮", -- f013
            symbols = {
              -- Standard unicode symbols to cycle through for LSP progress:
              spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
              -- Standard unicode symbol for when LSP is done:
              done = "✓",
              -- Delimiter inserted between LSP names:
              separator = " ",
            },
            -- List of LSP names to ignore (e.g., `null-ls`):
            ignore_lsp = {},
          },
        },
        lualine_y = { "searchcount" },
        lualine_z = { "branch" },
      },
    },
  },
  -- breadcrumbs
  {
    "LunarVim/breadcrumbs.nvim",
    dependencies = {
      {
        "SmiteshP/nvim-navic",
        opts = { lsp = { auto_attach = true } },
      },
    },
    opts = {},
  },
  -- tmux & windows
  "szw/vim-maximizer",
  "christoomey/vim-tmux-navigator",
  -- zen mode
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        height = 0.85,
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0, -- turn off the statusline in zen mode
        },
        tmux = { enabled = false },
        kitty = {
          enabled = true,
          font = "+4", -- font size increment
        },
      },
    },
    keys = {
      { "<leader>tz", ":ZenMode<CR>", mode = { "n", "v" }, desc = "zen" },
    },
  },
  -- diagnostics
  {
    "folke/trouble.nvim",
    event = "VimEnter",
    cmd = { "Trouble" },
    keys = {
      { "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", mode = { "n", "v" }, desc = "diagnostics" },
    },
    opts = {
      height = 5,
      auto_preview = false,
      use_diagnostic_sings = true,
    },
  },
  -- file browser
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>j",
        mode = { "n", "v" },
        "<cmd>Oil --float<cr>",
        desc = "open file browser (float)",
      },
      {
        "<leader>J",
        mode = { "n", "v" },
        "<cmd>Oil<cr>",
        desc = "open file browser (buffer)",
      },
    },
    opts = {
      float = {
        max_width = 0.7,
        max_height = 0.7,
      },
      keymaps = {
        ["H"] = "actions.parent",
        ["L"] = "actions.select",
        ["J"] = "actions.open_cwd",
        ["q"] = { "actions.close", mode = "n" },
      },
    },
  },
  -- indent line
  {
    "nvimdev/indentmini.nvim",
    opts = {},
  },
  -- scroll bar
  {
    "petertriho/nvim-scrollbar",
    opts = function()
      local theme_config = vim.fn["everforest#get_configuration"]()
      local colors = vim.fn["everforest#get_palette"](theme_config.background, theme_config.colors_override)

      return {
        handlers = {
          search = true,
        },
        handle = {
          color = colors.bg4[1],
          text = " ",
        },
        marks = {
          Cursor = { text = "▁" },
          Search = { text = { "▁" }, color = colors.orange[1] },
          Error = { text = { "▗" }, color = colors.red[1] },
          Warn = { text = { "▗" }, color = colors.yellow[1] },
          Info = { text = { "▗" }, color = colors.blue[1] },
          Hint = { text = { "▗" }, color = colors.aqua[1] },
          Misc = { text = { "▗" }, color = colors.purple[1] },
        },
      }
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    opts = {},
    config = function()
      require("scrollbar.handlers.search").setup({
        calm_down = true,
      })
    end,
  },
}
