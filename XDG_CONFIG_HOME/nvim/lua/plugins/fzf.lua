return {
  "ibhagwan/fzf-lua",
  config = function()
    require("fzf-lua").setup(
      {
        files = { cmd = 'fd --type file' },
        grep = { cmd = 'rg --column --line-number --no-heading --color=always --smart-case' },
        winopts = { backdrop = false, }
      }
    )

    vim.keymap.set('n', '<leader><leader>', require('fzf-lua').git_files, { silent = true, desc = 'FZF: Git Files' })
    vim.keymap.set('n', '<leader><bar>', require('fzf-lua').files, { silent = true, desc = 'FZF: Files' })

    vim.keymap.set('n', '<leader>fb', require('fzf-lua').buffers, { silent = true, desc = 'FZF: [B]uffers' })
    vim.keymap.set('n', '<leader>ft', require('fzf-lua').tabs, { silent = true, desc = 'FZF: [T]abs' })
    vim.keymap.set('n', '<leader>f"', require('fzf-lua').registers, { silent = true, desc = 'FZF: [R]egisters' })


    vim.keymap.set('n', '<leader>fgc', require("fzf-lua").git_commits, { silent = true, desc = "FZF: [G]it [C]ommits" })
    vim.keymap.set('n', '<leader>fgb', require("fzf-lua").git_commits, { silent = true, desc = "FZF: [G]it [B]ranches" })
    vim.keymap.set('n', '<leader>fgs', require("fzf-lua").git_commits, { silent = true, desc = "FZF: [G]it [S]tatus" })

    vim.keymap.set('n', '<leader>rg', require("fzf-lua").grep, { silent = true, desc = "FZF: [R]ip[G]rep" })
    vim.keymap.set('n', '<leader>F', require("fzf-lua").grep_cword, { silent = true, desc = "FZF: [f]ind word under cursor" })

    vim.keymap.set('n', '<leader><tab>', require('fzf-lua').keymaps, { silent = true, desc = 'FZF: Keymaps' })
    vim.keymap.set('v', '<leader><tab>', require('fzf-lua').keymaps, { silent = true, desc = 'FZF: Keymaps' })
    vim.keymap.set('x', '<leader><tab>', require('fzf-lua').keymaps, { silent = true, desc = 'FZF: Keymaps' })

    vim.keymap.set('i', '<C-x><C-f>', require("fzf-lua").complete_path, { silent = true, desc = "FZF: complete path" })
    vim.keymap.set('i', '<C-x><C-l>', require("fzf-lua").complete_line, { silent = true, desc = "FZF: complete line" })

    vim.keymap.set('x', '<leader>fld', require('fzf-lua').lsp_definitions, { silent = true, desc = 'FZF: [L]SP [D]efinitions' })
    vim.keymap.set('x', '<leader>flr', require('fzf-lua').lsp_references, { silent = true, desc = 'FZF: [L]SP [R]eferences' })
    vim.keymap.set('x', '<leader>fli', require('fzf-lua').lsp_implementations, { silent = true, desc = 'FZF: [L]SP [I]mplementations' })
  end,
}
