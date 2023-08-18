local wk = require('which-key');

wk.register({
    ["<F9>"] = {"<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint"},
    ["<F5>"] = {"<cmd>lua require'dap'.continue()<cr>", "Continue"},
    ["<F6>"] = {"<cmd>lua require'dap'.step_over()<cr>", "Continue"},
})

wk.register({
    b = {
        name= "buffer",
        p = {"<cmd>bp<cr>", "Buffer Previous"},
        d = {"<cmd>bd<cr>", "Buffer Delete"},
        n = {"<cmd>bn<cr>", "Buffer Next"}
    },
    p = {
        name = "project",
        b = {
            name= "debugger",
            c = {"<cmd>lua require'dap'.continue()<cr>", "Continue"},
            r = {"<cmd>lua require'dap'.run()<cr>", "Run"},
            b = {"<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint"},
            s = {"<cmd>lua require'dap'.step_over()<cr>", "Step Over"},
            S = {"<cmd>lua require'dap'.step_into()<cr>", "Step Into"},
            o = {"<cmd>lua require'dap'.step_out()<cr>", "Step Out"},
            t = {"<cmd>lua require'dap'.terminate()<cr>", "Terminate"},
            u = {"<cmd> lua require('dapui').toggle()<cr>", "Toggle UI"}
        }
    },
    h = {"<cmd>lua vim.lsp.buf.hover()<cr>","hover"}
},{prefix="<leader>"})
