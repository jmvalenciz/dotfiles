
vim.cmd[[nnoremap <leader>ft :NvimTreeToggle<CR>]]

vim.cmd[[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
require'nvim-tree'.setup {
    filters = {
        dotfiles = false,
        custom = {
            ".git",
            "node_modules",
            ".cache"
        }
    },
    git = {
        enable = false,
        ignore = false,
        timeout = 400
    },
    disable_netrw = true,
    hijack_netrw = true,
    ignore_ft_on_setup = { "dashboard" },
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },
    view = {
        side = "left",
        width = 25,
    },
    actions = {
        open_file ={
            resize_window = true,
            quit_on_open = false
        }
    },
    renderer = {
        indent_markers = {
            enable= false
        },
        highlight_git = true,
        add_trailing = false,
        root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" },
        highlight_opened_files = "icon",
        icons={
            show = {
                folder = true,
                folder_arrow = true,
                file = true,
            },
            glyphs={
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    empty = "", -- 
                    empty_open = "",
                    open = "",
                    symlink = "",
                    symlink_open = "",
                },
            }
        }
    }
}
