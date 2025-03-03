return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',

    config = function () 
        require('telescope').setup({
            defaults = {
                layout_config = {
                    horizontal = {
                        width = 0.9,
                        preview_width = 0.6, -- Adjust preview width
                    },
                    prompt_position = "bottom", -- Adjust prompt position
                },
            },
        })
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)

    end
}
