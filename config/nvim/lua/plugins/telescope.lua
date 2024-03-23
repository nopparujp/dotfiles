return {
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},

    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

    end
    --    keys = {
    --	    {"<leader>ff", "<cmd>Telescope find_files<cr>",desc = "Find Files"},
    --	    {"<leader>fg", "<cmd>Telescope live_grep", desc = "Live Grep"},
    --	    {"<leader>fb","<cmd>Telescope buffers", desc = "Buffers"},
    --	    {"<leader>fh","<cmd>Telescope help_tags", desc = "Help Tags"}
    --    }
}
