local map = vim.keymap.set -- for conciseness

return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    opts = {
      show_current_context = true,
      show_current_context_start = false,
    },
  },
  {
    'windwp/nvim-autopairs',
    event = 'BufRead',
    opts = function()
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
      return {
        options = {
          disable_filetype = { 'TelescopePrompt', 'vim' },
          check_ts = true,
        }
      }
    end,
  },
  {
    'numToStr/Comment.nvim',
    event = 'BufRead',
    opts = {},
  },
  'tpope/vim-repeat',
  'ggandor/lightspeed.nvim',
  {
    'tpope/vim-surround',
    event = 'BufRead',
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = 'VimEnter',
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    'NvChad/nvim-colorizer.lua',
    event = 'BufRead',
    opts = {
      user_default_options = {
        AARRGGBB = true,
      }
    }
  },
  {
    'filipdutescu/renamer.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      title = '',
      border_chars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    }
  },
  'echasnovski/mini.bracketed',

  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = { '<space>m' },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false
      })
      map('n', '<leader>m', require('treesj').toggle, { desc = 'split/join' })
    end
  },

  -- git
  {
    'lewis6991/gitsigns.nvim',
    event = 'VimEnter',
    opts = {},
  },
}
