return {
    {
        'theprimeagen/harpoon',
        branch = 'harpoon2',
        keys = {
            { "<leader>a", function() require("harpoon"):list():add() end, },
            { "<C-e>",     function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, },
            { "<C-h>",     function() require("harpoon"):list():select(1) end, },
            { "<C-j>",     function() require("harpoon"):list():select(2) end, },
            { "<C-k>",     function() require("harpoon"):list():select(3) end, },
            { "<C-l>",     function() require("harpoon"):list():select(4) end, },
        }
    },
    { 'nvim-lua/plenary.nvim', lazy = true },
}
