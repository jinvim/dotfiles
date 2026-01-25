-- keymappings for vscode-neovim plugin
if vim.g.vscode then
  local opts = { noremap = true, silent = true }

  local mappings = {
    -- doom emacs style shortcuts
    { 'n', '<leader>:', 'workbench.action.showCommands' },
    { 'n', '<leader>*', 'workbench.action.showAllSymbols' },
    { 'n', '<leader><leader>', 'workbench.action.quickOpen' },
    { 'n', '<leader><TAB>', 'workbench.action.nextEditorInGroup' },
    { 'n', '<leader><S-TAB>', 'workbench.action.previousEditorInGroup' },


    -- window management
    { 'n', '<leader>wv', 'workbench.action.splitEditor' },
    { 'n', '<leader>ws', 'workbench.action.splitEditorDown' },
    { 'n', '<leader>ww', 'workbench.action.joinTwoGroups' },
    { 'n', '<leader>we', 'workbench.action.evenEditorWidths' },
    { 'n', '<leader>wm', 'workbench.action.toggleMaximizeEditorGroup' },

    { 'n', '<leader>w+', 'workbench.action.increaseViewHeight' },
    { 'n', '<leader>w-', 'workbench.action.decreaseViewHeight' },
    { 'n', '<leader>w<', 'workbench.action.decreaseViewWidth' },
    { 'n', '<leader>w>', 'workbench.action.increaseViewWidth' },

    { 'n', '<leader>wj', 'workbench.action.navigateDown' },
    { 'n', '<leader>wk', 'workbench.action.navigateUp' },
    { 'n', '<leader>wh', 'workbench.action.navigateLeft' },
    { 'n', '<leader>wl', 'workbench.action.navigateRight' },

    { 'n', '<leader>wJ', 'workbench.action.moveEditorToBelowGroup' },
    { 'n', '<leader>wK', 'workbench.action.moveEditorToAboveGroup' },
    { 'n', '<leader>wH', 'workbench.action.moveEditorToLeftGroup' },
    { 'n', '<leader>wL', 'workbench.action.moveEditorToRightGroup' },

    -- file
    { 'n', '<leader>fn', 'workbench.action.files.newUntitledFile' },
    { 'n', '<leader>fq', 'workbench.action.closeActiveEditor' },
    { 'n', '<leader>fs', 'workbench.action.files.save' },
    { 'n', '<leader>fS', 'workbench.action.files.saveFiles' },
    { 'n', '<leader>fo', 'workbench.action.openRecent' },
    { 'n', '<leader>fp', 'copyFilePath' },
    { 'n', '<leader>fP', 'copyRelativeFilePath' },

    -- notebook
    { 'n', '<leader>r', 'quarto.runCurrentCell' },
    { 'v', '<leader>r', 'quarto.runSelection' },
    { 'n', '<leader>na', 'quarto.preview' },
    { 'n', '<leader>np', 'quarto.formatCell' },
    { 'n', '<leader>nK', 'quarto.runCellsAbove' },
    { 'n', '<leader>nR', 'quarto.runAllCells' },
    { 'n', '<leader>nj', 'quarto.runNextCell' },
    { 'n', '<leader>nJ', 'quarto.runCellsBelow' },
    { 'n', '<leader>nk', 'quarto.runPreviousCell' },
    { 'n', '<leader>n[', 'editor.fold' },
    { 'n', '<leader>n{', 'editor.foldAll' },
    { 'n', '<leader>n]', 'editor.unfold' },
    { 'n', '<leader>n}', 'editor.unfoldAll' },

    -- jinvim/vscode-zotero
    { 'n', '<leader>nr', 'zotero.searchLibrary' },
    { 'n', '<leader>no', 'zotero.openItem' },

    -- code
    { 'n', '<leader>p', 'editor.action.formatDocument' },
    { 'n', '<leader>ca', 'editor.action.quickFix' },
    { 'n', '<leader>cr', 'editor.action.rename' },
    { 'n', '<leader>cf', 'editor.action.refactor' },
    { 'n', '<leader>ci', 'editor.action.triggerSuggest' },
    { 'n', '<leader>cn', 'editor.action.marker.next' },
    { 'n', '<leader>cp', 'editor.action.marker.prev' },

    -- toggle
    { 'n', '<leader>tz', 'workbench.action.toggleZenMode' },

    -- help
    { 'n', '<leader>hr', 'workbench.action.reloadWindow' },
    { 'n', '<leader>h.', 'workbench.action.openSettingsJson' },

    -- editor commands
    { 'n', '<leader>ek', 'editor.action.copyLinesUpAction' },
    { 'n', '<leader>ej', 'editor.action.copyLinesDownAction' },
    { 'n', '<leader>eK', 'editor.action.moveLinesUpAction' },
    { 'n', '<leader>eJ', 'editor.action.moveLinesDownAction' },


    -- search
    -- { 'n', '<leader>ff', 'actions.find' },
    -- { 'n', '<leader>fr', 'editor.action.startFindReplaceAction' },
    -- { 'n', '<leader>fg', 'workbench.action.findInFiles' },
    -- { 'n', '<leader>rg', 'workbench.action.replaceInFiles' },
  }

  for _, mapping in ipairs(mappings) do
    local mode, key, command = mapping[1], mapping[2], mapping[3]

    vim.keymap.set(mode, key, function() vim.fn.VSCodeNotify(command) end, opts)
  end
end

return {}
