local signs = { Error = " ", Warn = "⚠ ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

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

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true
    --virtual_text = {
    --    prefix = '●', -- Could be '●', '▎', 'x'
    --}
})

-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    --require'lsp_signature'.on_attach(client)

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap=true, silent=true }
    --vim.cmd [[
    --  hi! LspReferenceRead gui=underline guibg=nil guifg=None
    --  hi! LspReferenceText gui=underline guibg=nil guifg=None
    --  hi! LspReferenceWrite gui=underline guibg=nil guifg=None
    --  ]]
    --vim.api.nvim_create_augroup('lsp_document_highlight', {})
    --vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    --    group = 'lsp_document_highlight',
    --    buffer = 0,
    --    callback = vim.lsp.buf.document_highlight,
    --})
    --vim.api.nvim_create_autocmd({'CursorMoved','CursorMovedI'}, {
    --    group = 'lsp_document_highlight',
    --    buffer = 0,
    --    callback = vim.lsp.buf.clear_references,
    --})
    --vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
    vim.api.nvim_create_autocmd({"CursorHold"}, {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = 'rounded',
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
            }
            vim.diagnostic.open_float(nil, opts)
        end
    })

    vim.keymap.set('n', '<space>fa', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gc', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>lwa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>lwr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>lwf', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>lD', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>lr', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>la', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    --vim.keymap.set('n', '<space>le', vim.lsp.diagnostic.show_line_diagnostics, bufopts)
    --vim.keymap.set('n', '[d', vim.lsp.diagnostic.goto_prev, bufopts)
    --vim.keymap.set('n', ']d', vim.lsp.diagnostic.goto_next, bufopts)
    --vim.keymap.set('n', '<space>q', vim.lsp.diagnostic.set_loclist, bufopts)
    vim.keymap.set('n', '<space>lf', function() vim.lsp.buf.format { async = true } end, bufopts)

end

return {
    "neovim/nvim-lspconfig",
    config = function()
        local nvim_lsp = require'lspconfig'
        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
        local system_name = "Linux"
        local sumneko_binary = "/usr/bin/lua-language-server"
        local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
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

        nvim_lsp.eslint.setup{
            on_attach = on_attach,
            capabilities = capabilities
        }

        nvim_lsp.emmet_ls.setup{
            filetypes = { 'html'},
            init_options = {
    html = {
                    options = {
                        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
["bem.enabled"] = true,
                    },
                },
            },
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

        nvim_lsp.cssls.setup {
            capabilities = capabilities,
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

        nvim_lsp.dartls.setup{
            on_attach = on_attach,
            capabilities=capabilities
        }

        nvim_lsp.bufls.setup{
            on_attach = on_attach,
            capabilities = capabilities
        }

        nvim_lsp.lua_ls.setup{
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {'vim'},
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }
    end
}
