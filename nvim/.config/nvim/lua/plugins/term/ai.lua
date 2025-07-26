-- for ai-related ones
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-i>",
        },
      },
      panel = { enable = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
    cond = function()
      return vim.loop.os_uname().sysname == "Darwin"
    end,
  },
}
