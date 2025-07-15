return {
  -- search engine
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim",
      "debugloop/telescope-undo.nvim",
    },
    cmd = "Telescope",
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      -- configure telescope
      telescope.setup({
        defaults = {
          prompt_prefix = "󰭎 ",
          selection_caret = "> ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          results_title = false,
          prompt_title = false,
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              width = 0.6,
              height = 0.4,
            },
            preview_cutoff = 120,
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { "node_modules" },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "truncate" },
          winblend = 0,
          border = true,
          borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
          color_devicons = false,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          mappings = {
            n = { ["q"] = actions.close },
          },
        },
        pickers = {
          buffers = {
            mirror = false,
            initial_mode = "insert",
            layout_strategy = "vertical",
            previewer = false,
          },
        },
      })
      telescope.load_extension("ui-select")
      telescope.load_extension("undo")
    end,
    keys = {
      -- basics
      { "<leader><leader>", "<cmd>Telescope buffers<cr>", mode = { "n", "v" }, desc = "switch buffer" },
      { "<leader>L", "<cmd>Telescope persisted<cr>", mode = { "n", "v" }, desc = "choose last session" },
      { "<leader>u", ":Telescope undo<cr>", mode = { "n", "v" }, desc = "undo history" },
      -- buffer
      { "<leader>bm", "<cmd>Telescope marks<cr>", mode = { "n", "v" }, desc = "search marks" },
      -- file
      { "<leader>ff", "<cmd>Telescope find_files<cr>", mode = { "n", "v" }, desc = "find files" },
      { "<leader>fo", "<cmd>Telescope oldfiles<cr>", mode = { "n", "v" }, desc = "open recent file" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", mode = { "n", "v" }, desc = "live grep" },
      -- help
      { "<leader>hh", ":Telescope help_tags<cr>", mode = { "n", "v" }, desc = "search help tags" },
      { "<leader>hk", ":Telescope keymaps<cr>", mode = { "n", "v" }, desc = "search keymaps" },
      { "<leader>ht", ":Telescope colorscheme<cr>", mode = { "n", "v" }, desc = "change colorscheme" },
    },
  },
}
