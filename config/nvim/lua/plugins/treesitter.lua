require 'nvim-treesitter.configs'.setup {
    ensure_installed = 'all',
    highlight = {
        enable = true,
        use_languagetree = true,
        disable = {"cmake"}
    },
    rainbow = {
        enable= true,
        extended_mode = false,
        max_file_lines = 1000,
    },
    indent = {
        enable = false,
    },
    autotag = {
        enable = true,
    },
    additional_vim_regex_highlighting = false
}
