require('flutter-tools').setup {
  debugger = {
    enabled = true,
    run_via_dap = true,
  },
  outline = { auto_open = false },
  decorations = {
    statusline = { device = true, app_version = true },
  },
  widget_guides = { enabled = true, debug = true },
  dev_log = { enabled = false, open_cmd = 'tabedit' },
  lsp = {
    color = {
      enabled = true,
      background = false,
      virtual_text = true,
      virtual_text_str = '■',
      background_color = { r = 19, g = 17, b = 24 },
    },
    settings = {
      showTodos = true,
      renameFilesWithClasses = 'prompt',
    },
  },
}
