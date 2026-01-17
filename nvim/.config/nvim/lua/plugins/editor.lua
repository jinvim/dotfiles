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
    "https://codeberg.org/andyg/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
      vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')
    end,
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
}
