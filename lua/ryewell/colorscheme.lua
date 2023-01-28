vim.cmd [[
try
  colorscheme sonokai
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
