local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>ff", "<Cmd>FzfLua files<cr>", opts)
keymap("n", "<leader>fg", "<Cmd>FzfLua live_grep<cr>", opts)
keymap("n", "<leader>fb", "<Cmd>FzfLua buffers<cr>", opts)
