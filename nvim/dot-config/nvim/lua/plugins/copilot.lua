return  {
  "github/copilot.vim",
  cmd = "Copilot",
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
  end,
  config = function()
    -- Accept suggestion
    vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', {
      expr = true,
      replace_keycodes = false,
      silent = true,
      desc = 'AI: Accept'
    })

    -- Cycle suggestions
    vim.keymap.set("i", "<C-n>", "<Plug>(copilot-next)", { silent = true, desc = "AI: [N]ext" })
    vim.keymap.set("i", "<C-p>", "<Plug>(copilot-previous)", { silent = true, desc = "AI: [P]revious" })
  end,
}
