return {
    "folke/tokyonight.nvim",
    name ="tokyonight",
    --"rose-pine/neovim",
    -- name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd("colorscheme tokyonight-night")
        -- vim.cmd("colorscheme rose-pine")
        vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
        vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
    end
}
