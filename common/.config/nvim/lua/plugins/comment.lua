return {
    'numToStr/Comment.nvim',
    opts = {
        toggler = {
            line = 'gcc',
            block = 'gbc',
        },
        opleader = {
            line = 'gc',
            block = 'gb',
        }
    },
    config = function()
        local keymap = vim.api.nvim_set_keymap
        -- comment remap
        keymap('n', '<C-_>', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>',
            { noremap = true, silent = true })
        keymap('i', '<C-_>', '<Esc><cmd>lua require("Comment.api").toggle.linewise.current()<CR>gi',
            { noremap = true, silent = true })
        keymap('v', '<C-_>', '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
            { noremap = true, silent = true })
    end

}
