if not vim.g.vscode then
  vim.treesitter.language.register("markdown", { "quarto", "rmd" })

  local runner = require("quarto.runner")
  vim.keymap.set("n", "<leader>na", ":QuartoActivate<cr>", { desc = "activate", silent = true })
  vim.keymap.set("n", "<leader>np", ":QuartoPreview<cr>", { desc = "preview", silent = true })
  vim.keymap.set("n", "<leader>nq", ":QuartoClosePreview<cr>", { desc = "close preview", silent = true })
  vim.keymap.set("n", "<leader>nc", runner.run_cell, { desc = "run cell", silent = true })
  vim.keymap.set("n", "<leader>nu", runner.run_above, { desc = "run cell and above", silent = true })
  vim.keymap.set("n", "<leader>nA", runner.run_all, { desc = "run all cells", silent = true })
  vim.keymap.set("n", "<leader>nl", runner.run_line, { desc = "run line", silent = true })
  vim.keymap.set("n", "<leader>nR", function()
    runner.run_all(true)
  end, { desc = "run all cells of all languages", silent = true })
  vim.keymap.set("n", "<leader>nr", ":Telescope zotero<cr>", { desc = "zotero citations", silent = true })
  vim.keymap.set({ "n", "i", "v" }, "<M-r>", "<cmd>Telescope zotero<cr>", { desc = "zotero citations", silent = true })

  -- function that retrrievs the buffer name of "manuscript.qmd" and saves it, and comback to the current buffer
  -- because quarto only triggers preview refresh on save of the main file
  local function write_main()
    local open_files = vim.api.nvim_list_bufs()

    if not vim.g.quarto_main_bufnr then
      local main_bufnr = vim
        .iter(open_files)
        :map(function(buf)
          local name = vim.api.nvim_buf_get_name(buf)
          return name:match("manuscript.qmd") and buf or nil
        end)
        :find(function(buf)
          return buf ~= nil
        end)
      vim.g.quarto_main_bufnr = main_bufnr
    end

    if vim.g.quarto_main_bufnr then
      local bufnr = vim.api.nvim_get_current_buf()
      vim.api.nvim_set_current_buf(vim.g.quarto_main_bufnr)
      vim.api.nvim_command("write")
      vim.api.nvim_set_current_buf(bufnr)
    else
      vim.notify("no bufnr found for manuscript.qmd; maybe it's not open?", vim.log.levels.INFO)
    end
  end
  vim.keymap.set("n", "<leader>nw", write_main, { desc = "write manuscript.qmd", silent = true })
end
