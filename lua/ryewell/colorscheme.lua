vim.cmd [[
try
  colorscheme monokai
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

vim.cmd [[
  highlight CmpScrollbarThumb guifg=#1E3A8A guibg=NONE
]]
vim.cmd [[
  highlight CmpScrollbar guifg=#1E3A8A guibg=NONE
]]
