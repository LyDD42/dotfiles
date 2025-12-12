vim.g.have_nerd_font = true

--vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.showcmd = true
-- vim.opt.showmode = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  See `:help 'clipboard'`
vim.schedule(function()
  if vim.fn.has("clipboard") == 1 then
    vim.opt.clipboard = 'unnamedplus' -- sync with system clipboard
  else
    vim.opt.mouse = '' -- headless server
  end
end)

vim.opt.ruler = true
-- Show which line your cursor is on
vim.opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildignorecase = true

-- highlight search
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Buffer movement
vim.keymap.set('n', ']b', ':bn<CR>')
vim.keymap.set('n', '[b', ':bp<CR>')
--vim.keymap.set('n', 'db', ':bd<CR>')

-- Tab movement
vim.keymap.set('n', ']t', ':tabnext<CR>')
vim.keymap.set('n', '[t', ':tabprev<CR>')
-- vim.keymap.set('n', 'dt', ':tabc<CR>')

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

vim.api.nvim_create_autocmd( "FileType", {
  pattern = 'python',
  callback = function(event)
    -- vim.keymap.set('n', '<leader>f', "my:0,$!ruff format -q -<CR>'y", { desc = '[F]ormat' })
    -- vim.keymap.set('v', '<leader>f', ":'<,'>!ruff format -q -<CR>", { desc = '[F]ormat' })

    vim.opt_local.textwidth = 120
    vim.opt_local.colorcolumn = '120'
    vim.opt_local.omnifunc = 'v:lua.vim.lsp.omnifun '
  end,
  group = vim.api.nvim_create_augroup('augroup_python', { clear = true }),
})

vim.api.nvim_create_autocmd( "FileType", {
  pattern = 'lua',
  callback = function(event)
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
  group = vim.api.nvim_create_augroup('augroup_lua', { clear = true }),
})

vim.api.nvim_create_autocmd( "FileType", {
  pattern = 'yaml',
  callback = function(event)
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
  group = vim.api.nvim_create_augroup('augroup_yaml', { clear = true }),
})

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      'morhetz/gruvbox',
      priority = 1000, -- Make sure to load this before all the other start plugins.
      config = function()
        vim.opt.background = "dark"
        vim.cmd.colorscheme 'gruvbox'
      end,
    },
    { -- Highlight, edit, and navigate code
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      main = 'nvim-treesitter.configs', -- Sets main module to use for opts
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
      opts = {
        ensure_installed = { 'bash', 'cpp', 'diff', 'html', 'lua', 'markdown', 'markdown_inline', 'python', 'vim', 'vimdoc', 'yaml' },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = { enable = true, },
        indent = { enable = true },
      },
    },
    {
      'nvim-lualine/lualine.nvim',
      config = function()
        require('lualine').setup {
          options = { theme = 'gruvbox' },
          sections = {
            lualine_c = { { 'filename', path = 1, }, },
          },
        }
      end,
    },
    { 'windwp/nvim-autopairs', opts = {} },
    { 'tpope/vim-fugitive' },
    {
      "ibhagwan/fzf-lua",
      config = function()
        require("fzf-lua").setup(
          {
            files = { cmd = 'fd --type file' },
            grep = { cmd = 'rg --column --line-number --no-heading --color=always --smart-case' },
          }
        )

        vim.keymap.set('n', '<leader><leader>', require('fzf-lua').git_files, { silent = true, desc = 'FZF: Git Files' })
        vim.keymap.set('n', '<leader><bar>', require('fzf-lua').files, { silent = true, desc = 'FZF: Files' })
        vim.keymap.set('n', '<leader>a', require('fzf-lua').buffers, { silent = true, desc = 'FZF: Buffers' })
        vim.keymap.set('n', '<leader>A', require('fzf-lua').tabs, { silent = true, desc = 'FZF: Tabs' })


        vim.keymap.set('n', '<leader>gc', require("fzf-lua").git_commits, { silent = true, desc = "FZF: [G]it [C]ommits" })
        vim.keymap.set('n', '<leader>rg', require("fzf-lua").grep, { silent = true, desc = "FZF: [R]ip[G]rep" })
        vim.keymap.set('n', '<leader>F', require("fzf-lua").grep_cword, { silent = true, desc = "FZF: [f]ind word under cursor" })

        vim.keymap.set('n', '<leader><tab>', require('fzf-lua').keymaps, { silent = true, desc = 'FZF: Keymaps' })
        vim.keymap.set('v', '<leader><tab>', require('fzf-lua').keymaps, { silent = true, desc = 'FZF: Keymaps' })
        vim.keymap.set('x', '<leader><tab>', require('fzf-lua').keymaps, { silent = true, desc = 'FZF: Keymaps' })

        vim.keymap.set('i', '<C-x><C-f>', require("fzf-lua").complete_path, { silent = true, desc = "FZF: complete path" })
        vim.keymap.set('i', '<C-x><C-l>', require("fzf-lua").complete_line, { silent = true, desc = "FZF: complete line" })
      end,
    },
    {
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
    },
    require 'plugins.completion',
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
