local ui = require("harpoon.ui")
vim.keymap.set("n","<leader>m", "<cmd>lua require('harpoon.mark').add_file()<CR>")
vim.keymap.set("n","<leader>M", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
vim.keymap.set("n", "<space>h", function() ui.nav_file(1) end)
vim.keymap.set("n", "<space>j", function() ui.nav_file(2) end)
vim.keymap.set("n", "<space>k", function() ui.nav_file(3) end)
vim.keymap.set("n", "<space>l", function() ui.nav_file(4) end)
