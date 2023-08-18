return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = {
                'arduino', 'awk', 'bash', 'c', 'c_sharp',
                'cpp', 'css', 'dart', 'diff', 'dockerfile',
                'git_rebase', 'gitcommit', 'gitignore', 'go',
                'gomod', 'gowork', 'graphql', 'html', 'java',
                'javascript', 'jsdoc', 'jsonc', 'latex', 'llvm',
                'lua', 'make', 'markdown', 'markdown_inline',
                'python', 'rust', 'scss', 'sql', 'svelte', 'toml',
                'tsx', 'typescript', 'vim', 'vue', 'yaml'
            },
            highlight = {
                enable = true,
                use_languagetree = true,
                disable = {"cmake"},
                additional_vim_regex_highlighting = false
            },
            indent = {
                enable = true
            },
            autotag = {
                enable = true,
            },
        }

    end
}
