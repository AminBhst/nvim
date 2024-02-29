  require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 40,
    }
})

vim.keymap.set("n", "<space>ha", "<Cmd>:lua require('harpoon.mark').add_file()<CR>", {silent = true})
vim.keymap.set("n", "<space>hm", "<Cmd>:lua require('harpoon.ui').toggle_quick_menu()<CR>", {silent = true})
vim.keymap.set("n", "<C-n>", "<Cmd>:lua require('harpoon.ui').nav_next()<CR>", {silent = true})
vim.keymap.set("n", "<C-p>", "<Cmd>:lua require('harpoon.ui').nav_prev()<CR>", {silent = true})
