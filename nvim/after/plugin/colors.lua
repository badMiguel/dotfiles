function ColorMyPencils(color)
    local color_options = {
        "catppuccin",
        "kanagawa",
        "nord",
        "rose-pine",
        'sonokai',
        'everforest',
        'nightfox',
        'nordic',
        'dracula',
    }

    color = color or color_options[4]
    -- color = color or color_options[math.random(7)]

    if color == 'catppuccin' then
        require('catppuccin').setup{
            transparent_background = true
        }
    elseif color == 'kanagawa' then
        require('kanagawa').setup{
            transparent = true,
            colors = {
                theme = { all = { ui = { bg_gutter = "none" } } },
            },
        }
    elseif color == 'rose-pine' then
        require('rose-pine').setup({
            styles = {
                transparency = true,
            } ,
        })
    elseif color == "sonokai" then
        vim.g.sonokai_transparent_background = 2
    elseif color == "everforest" then
        vim.g.everforest_transparent_background = 2
    elseif color == 'nightfox' then
        require('nightfox').setup({
            options = {
                transparent = true,
            }
        })
    end 

    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
    -- vim.api.nvim_set_hl(0, "LineNr", { bg = 'none' })
    vim.api.nvim_set_hl(0, "FoldColumn", { bg = 'none' })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = 'none' })
end

ColorMyPencils()

