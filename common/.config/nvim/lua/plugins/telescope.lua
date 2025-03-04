return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    opts = {
        defaults = {
            layout_config = {
                horizontal = {
                    width = 0.9,
                    preview_width = 0.6,    -- Adjust preview width
                },
                prompt_position = "bottom", -- Adjust prompt position
            },
        },
    },
    keys = {
        { "<leader>pf", function() require("telescope.builtin").find_files() end, },
        { "<C-p>",      function() require('telescope.builtin').git_files() end, },
        { "<leader>ps", function()
            require('telescope.builtin').grep_string({
                search = vim.fn.input("Grep > ")
            })
        end },
    }
}
