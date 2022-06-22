require('luasnip').config.set_config({})
require("luasnip.loaders.from_vscode").load({
    include = {
        "python",
        "lua",
        "rust",
        "cpp",
        "c",
        "css",
        "cobol",
        "gdscript",
        "glsl",
        "html",
        "javascript",
        "typescript",
        "react",
        "svelte",
        "go"
    }
})

