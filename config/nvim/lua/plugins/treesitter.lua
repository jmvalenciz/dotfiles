require 'nvim-treesitter.configs'.setup {
    ensure_installed = 'maintained',
    highlight = {enable = true},
    rainbow = {
        enable= true,
        extended_mode = false,
        max_file_lines = 1000,
    },
    indent = {
        enable = true,
    },
    disable = {"html"}
}
