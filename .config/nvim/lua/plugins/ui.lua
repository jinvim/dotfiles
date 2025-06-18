return {
  -- dashboard
  { "echasnovski/mini.starter", opts = {} },
  -- icons
  "kyazdani42/nvim-web-devicons",
  -- status line
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      return {
        options = {
          icons_enabled = true,
          section_separators = "",
          component_separators = "",
          globalstatus = true,
        },
        sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename", "diagnostics", "diff" },
          lualine_x = { "branch", "location", },
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
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
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "VimEnter",
    opts = {
      text = { spinner = "dots_snake" },
      window = { blend = 0 },
    },
  },
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
}
