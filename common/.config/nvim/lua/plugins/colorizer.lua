return {
    'norcalli/nvim-colorizer.lua',
    ft = "*",
    config = function()
        require 'colorizer'.setup()
    end
}
