    local nvim_lsp = require'lspconfig'
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local system_name = "Linux"
    local sumneko_binary = "/usr/bin/lua-language-server"
    local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'


    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    function PrintDiagnostics(opts, bufnr, line_nr, client_id)
    opts = opts or {}

    bufnr = bufnr or 0
    line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)

    local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr, line_nr, opts, client_id)
    if vim.tbl_isempty(line_diagnostics) then return end

    local diagnostic_message = ""
    for i, diagnostic in ipairs(line_diagnostics) do
        diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
        print(diagnostic_message)
        if i ~= #line_diagnostics then
        diagnostic_message = diagnostic_message .. "\n"
        end
    end
    vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
    end

    vim.cmd [[ autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="line"}) ]]

    local signs = { Error = " ", Warn = "⚠ ", Hint = " ", Info = "🛈 " }
    for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = true
        --virtual_text = {
        --    prefix = '●', -- Could be '●', '▎', 'x'
        --}
    })

    -- Code actions
    capabilities.textDocument.codeAction = {
        dynamicRegistration = true,
        codeActionLiteralSupport = {
            codeActionKind = {
                valueSet = (function()
                    local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
                    table.sort(res)
                    return res
                end)()
            }
        }
    }
    capabilities.textDocument.completion.completionItem.snippetSupport = true;
    capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    }
    }

    local signature_cfg = {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
                        -- If you want to hook lspsaga or other signature handler, pls set to false
        doc_lines = 0, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                        -- set to 0 if you DO NOT want any API comments be shown
                        -- This setting only take effect in insert mode, it does not affect signature help in normal
                        -- mode, 10 by default

        floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
        fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
        hint_enable = true, -- virtual hint enable
        hint_prefix = " 🐼 -> ",  -- Panda for parameter
        hint_scheme = "String",
        use_lspsaga = false,  -- set to true if you want to use lspsaga popup
        hi_parameter = "Search", -- how your parameter will be highlight
        max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
                        -- to view the hiding contents
        max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
        handler_opts = {
            border = "shadow"   -- double, single, shadow, none
        },
        extra_trigger_chars = {"(",","} -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
        -- deprecate !!
        -- decorator = {"`", "`"}  -- this is no longer needed as nvim give me a handler and it allow me to highlight active parameter in floating_window

    }

    -- function to attach completion when setting up lsp
    local on_attach = function(client, bufnr)

            --require'lsp_signature'.on_attach(client)

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end

        buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

        local opts = { noremap=true, silent=true }

        --vim.cmd[[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
        --vim.cmd[[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
        --vim.cmd[[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
        buf_set_keymap('n', '<space>la', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<Cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
    buf_set_keymap('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

nvim_lsp.rust_analyzer.setup{
    on_attach=on_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
}

nvim_lsp.tsserver.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.terraformls.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require'lspconfig'.angularls.setup{}

--nvim_lsp.java_language_server.setup{
--    cmd="java-lang-server"
--}

nvim_lsp.html.setup{
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html" },
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true
        }
    },
    settings = {},
    single_file_support = true
}

--nvim_lsp.emmet_ls.setup{
--    on_attach = on_attach,
--    capabilities = capabilities,
--    filetypes = { "html", "css", "svelte" },
--    cmd = { "emmet-ls", "--stdio" }
--}

nvim_lsp.svelte.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.dockerls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.gopls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.pyright.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.ccls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
  }
}

nvim_lsp.sumneko_lua.setup{
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

