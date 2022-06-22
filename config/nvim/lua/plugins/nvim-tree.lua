vim.g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
vim.g.nvim_tree_git_hl = 1

vim.cmd[[nnoremap <leader>ft :NvimTreeToggle<CR>]]

vim.g.nvim_tree_show_icons = {
    folders = 1,
    folder_arrows= 1,
    files = 1,
}

vim.g.nvim_tree_icons = {
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
        }
    }
}
