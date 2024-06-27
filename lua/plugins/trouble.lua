return {
  "folke/trouble.nvim",
  -- opts = {
  --   defaults = {
  --     focus = true
  --   },
  --   win = {
  --     type = "float",
  --     scratch = false,
  --     focus = true
  --   },
  --   preview = {
  --     type = "main",
  --     scratch = false
  --   }
  -- },
  keys = {
    { "<leader>cs", "<cmd>Trouble symbols toggle focus=true auto_preview=true preview.type=float<cr>", desc = "Symbols (Trouble)" },
    {
      "<leader>cS",
      "<cmd>Trouble lsp toggle focus=true auto_preview=true preview.type=float<cr>",
      desc = "LSP references/definitions/... (Trouble)",
    },
  },
  modes = {
    preview_float = {
      mode = "symbols",
      preview = {
        type = "float",
        relative = "editor",
        border = "rounded",
        title = "Preview",
        title_pos = "center",
        position = { 0, -2 },
        size = { width = 0.3, height = 0.3 },
        zindex = 200,
      },
    },
  },
}
