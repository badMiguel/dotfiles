return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },

    config = function()
        local rose_pine = require 'lualine.themes.rose-pine'

        rose_pine.normal.c.bg = '#00000000'
        rose_pine.insert.c.bg = '#00000000'
        rose_pine.visual.c.bg = '#00000000'
        rose_pine.command.c.bg = '#00000000'

        require('lualine').setup {
            options = { theme = rose_pine },
        }
    end
}
