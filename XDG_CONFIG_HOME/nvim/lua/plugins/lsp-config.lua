return {
  'neovim/nvim-lspconfig',
  config = function()
    -- set omnifunc
    vim.opt.omnifunc = 'v:lua.vim.lsp.omnifun '

    -- Diagnostic keymaps
    vim.keymap.set('n', '<leader>el',
      function() vim.diagnostic.setloclist({ severity = { min=vim.diagnostic.severity.WARN } }) end,
      { desc = 'Open diagnostic [Q]uickfix list' })
    vim.keymap.set('n', '<leader>eL',
      function() vim.diagnostic.setloclist({ severity = { min=vim.diagnostic.severity.HINT } }) end,
      { desc = 'Open diagnostic [Q]uickfix list' })

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP: Hover' })

    -- borrowed from kickstarter, but not an autocmd
    vim.keymap.set('n', '<leader>gg', vim.lsp.buf.definition, { desc = 'LSP: [G]oto Definition' })
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.declaration, { desc = 'LSP: [G]oto [D]eclaration' })
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = 'LSP: [G]oto [I]mplementation' })
    vim.keymap.set('n', '<leader>gu', vim.lsp.buf.references, { desc = 'LSP: [G]oto [R]eferences' })
    vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, { desc = 'LSP: [R]ename' })
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'LSP: [F]ormat' })
    vim.keymap.set('v', '<leader>f', vim.lsp.buf.format, { desc = 'LSP: [F]ormat' })
    vim.keymap.set('n', '<leader>cc', vim.lsp.buf.code_action, { desc = 'LSP: [C]ode Action' })

    -- lsp
    local capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

    vim.lsp.config('pyright', {
      capabilities = capabilities,
      settings = {
        pyright = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            -- Ignore all files for analysis to exclusively use Ruff for linting
            ignore = { '*' },
          },
          pythonPath = vim.fn.expand("$HOME/.local/bin/python"),
        },
      },
    })

    vim.lsp.config('ruff', {
      capabilities = capabilities,
      init_options = {
        settings = {
          configurationPreference = "editorOnly"
        },
      },
    })

    -- Enable the configs
    vim.lsp.enable('pyright')
    vim.lsp.enable('ruff')
  end
}
