vim.cmd[[set background=dark]]
vim.cmd[[set termguicolors]]
vim.cmd[[let g:gruvbox_material_palette = "original"]]

vim.cmd[[let g:gruvbox_material_background = 'hard']]

vim.g.gruvbox_material_enable_italic_comment = 1

vim.g.gruvbox_material_italic = 1
vim.g.gruvbox_material_palette = ""
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_underline = 1
vim.g.gruvbox_material_undercurl = 1

vim.g.tokyonight_style = "night"
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_lualine_bold = true

--require('gruvbox-material').setup()
vim.cmd[[colorscheme tokyonight]]
