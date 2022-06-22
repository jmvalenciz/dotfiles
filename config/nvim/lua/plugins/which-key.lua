local wk = require('which-key');

wk.register({
    b = {
        name= "buffer",
        p = {"<cmd>bp<cr>", "Buffer Previous"},
        d = {"<cmd>bd<cr>", "Buffer Delete"},
        n = {"<cmd>bn<cr>", "Buffer Next"}
    }
})
