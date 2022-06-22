require'lspsaga'.init_lsp_saga()


vim.cmd[[nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]]

-- scroll down hover doc or scroll in definition preview
vim.cmd("nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
-- scroll up hover doc
vim.cmd("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
