return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "fang2hou/blink-copilot",
      "jmbuhr/cmp-pandoc-references",
    },
    version = "*",
    opts = {
      keymap = {
        preset = "super-tab",
        ["<C-k>"] = {},
        ["<C-e>"] = {
          function(cmp)
            cmp.show()
          end,
        },
        ["<C-y>"] = { "select_and_accept" },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "references", "copilot", "lsp", "path", "snippets", "buffer" },
        -- default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
          references = {
            name = "pandoc_references",
            module = "cmp-pandoc-references.blink",
          },
        },
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
