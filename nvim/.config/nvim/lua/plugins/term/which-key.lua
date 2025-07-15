return {
  {
    "folke/which-key.nvim",
    opts = {
      preset = "classic",
      layout = {
        spacing = 6, -- spacing between columns
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      vim.cmd("hi WhichKeyNormal guibg=#1d2021")
      vim.cmd("hi WhichKeyBorder guibg=#1d2021")
      vim.cmd("hi WhichKeyTitle guibg=#1d2021")
      wk.setup(opts)
      wk.add({
        -- leader maps
        -- basics
        { "<leader><TAB>", ":bnext <CR>", desc = "next buffer" },
        { "<leader><S-TAB>", ":bprev <CR>", desc = "previous buffer" },
        { "<leader>s", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", desc = "replace word" },
        { "<leader>S", ":%s/<C-r><C-w>/<C-r>0/g<CR>", desc = "replace word with register" },

        -- buffer
        { "<leader>b", group = "buffer" },
        { "<leader>bn", "<cmd> enew <CR>", desc = "new buffer" },
        { "<leader>bq", ":bd <CR>", desc = "kill buffer" },
        { "<leader>bQ", ":bd! <CR>", desc = "kill buffer without saving" },
        { "<leader>br", ":bufdo :e <CR>", desc = "refresh buffers" },
        { "<leader>bs", ":w <CR>", desc = "save buffer" },
        { "<leader>bS", ":wa <CR>", desc = "save all buffers" },

        -- file
        { "<leader>f", group = "file" },
        { "<leader>fa", ":wa <CR>", desc = "save all files" },
        { "<leader>fd", "<cmd>cd %:p:h <CR>", desc = "set file dir as working dir" },
        { "<leader>fn", ":e ", desc = "new file" },
        { "<leader>fR", ":sav ", desc = "rename file" },
        { "<leader>fs", ":w <CR>", desc = "save file" },
        { "<leader>fS", ":w ", desc = "save file as" },
        { "<leader>fx", "<cmd>!chmod +x %<CR>", desc = "chmod +x" },

        -- help
        { "<leader>h", group = "help" },
        { "<leader>hl", ":Lazy<CR>", desc = "lazy" },
        { "<leader>hr", ":LspRestart<CR>", desc = "restart lsp" },

        -- quit
        { "<leader>q", group = "quit" },
        { "<leader>ql", "<cmd>SessionLoad<cr>", desc = "reload last session" },
        { "<leader>qq", ":qa <CR>", desc = "quit all" },
        { "<leader>qQ", ":qa! <CR>", desc = "quit all without saving" },
        { "<leader>qs", ":xa <CR>", desc = "save all files and quit" },

        -- toggle
        { "<leader>t", group = "toggle" },
        { "<leader>tL", ":set rnu!<CR>", desc = "toggle relative number" },
        { "<leader>tl", ":set nu! rnu!<CR>", desc = "toggle line number" },
        {
          "<leader>td",
          function()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled())
          end,
          desc = "toggle diagnostics",
        },

        -- window
        { "<leader>w", group = "windows" },
        { "<leader>w+", "<C-w>+", desc = "increase height" },
        { "<leader>w-", "<C-w>-", desc = "decrease height" },
        { "<leader>w<", "<C-w><", desc = "decrease width" },
        { "<leader>w>", "<C-w>>", desc = "increase width" },
        { "<leader>we", "<C-w>=", desc = "eqaulize split window" },

        { "<leader>wh", "<C-w>h", desc = "window left" },
        { "<leader>wj", "<C-w>j", desc = "window down" },
        { "<leader>wk", "<C-w>k", desc = "window up" },
        { "<leader>wl", "<C-w>l", desc = "window right" },

        { "<leader>wm", ":MaximizerToggle<CR>", desc = "maximize split window" },
        { "<leader>wq", ":close<CR>", desc = "close window" },
        { "<leader>ws", "<C-w>s", desc = "split window horizontally" },
        { "<leader>wv", "<C-w>v", desc = "split window vertically" },

        -- code related
        { "<leader>cl", "<cmd>LspInfo<cr>", desc = "lsp info" },
        { "gd", vim.lsp.buf.definition, desc = "goto definition" },
        { "gr", vim.lsp.buf.references, desc = "references", nowait = true },
        { "gI", vim.lsp.buf.implementation, desc = "goto implementation" },
        { "gy", vim.lsp.buf.type_definition, desc = "goto t[y]pe definition" },
        { "gD", vim.lsp.buf.declaration, desc = "goto declaration" },
        {
          "K",
          function()
            return vim.lsp.buf.hover()
          end,
          desc = "hover",
        },
        {
          "gK",
          function()
            return vim.lsp.buf.signature_help()
          end,
          desc = "signature help",
        },

        { "<leader>c", group = "code" },
        { "<leader>ca", vim.lsp.buf.code_action, desc = "code action", mode = { "n", "v" } },
        { "<leader>cc", vim.lsp.codelens.run, desc = "run codelens", mode = { "n", "v" } },
        { "<leader>cC", vim.lsp.codelens.refresh, desc = "refresh & display codelens", mode = { "n" } },
        { "<leader>cr", vim.lsp.buf.rename, desc = "rename" },
      })
    end,
  },
}
