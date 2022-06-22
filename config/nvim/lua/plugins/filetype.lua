require('filetype').setup({
    overrides = {
        complex = {
            -- Set the filetype of any full filename matching the regex to gitconfig
            [".*git/config"] = "gitconfig",  -- Included in the plugin
        },
    }
})
