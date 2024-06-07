function ColorMyPencils(color)
    local color_options = {"catppuccin", "kanagawa", "nord", "rose-pine"}
	color = color or color_options[3]
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
    vim.api.nvim_set_hl(0, "LineNr", { bg = 'none' })
    vim.api.nvim_set_hl(0, "FoldColumn", { bg = 'none' })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = 'none' })
end

ColorMyPencils()
