require("monokai-pro").setup({
  transparent_background = true,
  italic_comments = true,
  filter = "spectrum",
  inc_search = "background", -- underline | background
  background_clear = { "float_win", "toggleterm", "telescope", "which-key", "renamer" },
  diagnostic = {
    background = true,
  },
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
    },
    indent_blankline = {
      context_highlight = "default", -- default | pro
    },
  },
})
