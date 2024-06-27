-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Auto commands for Go files
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"go", "astro", "vue", "php", "js"},
  callback = function()
    -- Set tab width to 4 spaces
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    -- Use tabs instead of spaces
    vim.opt_local.expandtab = false
    -- Enable auto indentation
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true
  end
})
