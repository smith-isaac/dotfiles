" LSP-Config setup file
lua << EOF
require'lspconfig'.solargraph.setup{}
require'lspconfig'.clangd.setup{}
EOF

