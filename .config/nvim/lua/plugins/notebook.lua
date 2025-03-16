return {
  {
    "jmbuhr/otter.nvim",
    opts = {
      buffers = {
        set_filetype = true,
        write_to_disk = true,
      },
    },
    enabled = function()
      -- Only enable this plugin on macOS
      return vim.loop.os_uname().sysname == "Darwin"
    end,
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
    enabled = function()
      -- Only enable this plugin on macOS
      return vim.loop.os_uname().sysname == "Darwin"
    end,
    ft = { "quarto" },
  },
  {
    "Vigemus/iron.nvim",
    config = function()
      local iron = require("iron.core")
      local view = require("iron.view")
      local common = require("iron.fts.common")

      iron.setup({
        config = {
          scratch_repl = true,
          repl_definition = {
            sh = {
              command = { "zsh" },
            },
            python = {
              command = { "ipython", "--no-autoindent", "-i" },
              format = common.bracketed_paste,
              block_deviders = { "# %%", "#%%", "```" },
            },
            r = {
              command = { "radian" },
              format = common.bracketed_paste,
              block_deviders = { "```" },
            },
            -- stata = {
            --   command = { "stata-mp" },
            --   format = common.bracketed_paste,
            --   block_deviders = { "```" },
            -- },
          },
          repl_filetype = function(_, ft)
            return ft
          end,
          repl_open_cmd = view.split.vertical.botright("%40"),
        },
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      })
    end,
    keys = {
      { "<leader>r", function() require("iron.core").visual_send() end, desc = "send visual to repl", mode = { "v" } },
      { "<leader>r", function() require("iron.core").send_code_block() end, desc = "send block to repl", mode = { "n" } },
      { "<leader>it", "<cmd>IronRepl<cr>", desc = "toggle" },
      { "<leader>iR", "<cmd>IronRestart<cr>", desc = "restart" },
      { "<leader>iA", function() require("iron.core").send_file() end, desc = "send file" },
      { "<leader>iq", function() require("iron.core").close_repl() end, desc = "exit" },
      { "<leader>il", function() require("iron.core").send(nil, string.char(12)) end, desc = "clear" },
      { "<leader>i<cr>", function() require("iron.core").send(nil, string.char(13)) end, desc = "cr" },
      { "<leader>ic", function() require("iron.core").send(nil, string.char(03)) end, desc = "interrupt" },
    },
    enabled = function()
      -- Only enable this plugin on macOS
      return vim.loop.os_uname().sysname == "Darwin"
    end,
    ft = { "python", "r" },
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
    enabled = function()
      -- Only enable this plugin on macOS
      return vim.loop.os_uname().sysname == "Darwin"
    end,
    ft = { "quarto" },
  },
}
