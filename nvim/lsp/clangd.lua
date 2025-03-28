return {
    cmd = { 'clangd', '--header-insertion=never' },
    filetypes = { 'c', 'cpp' },
    root_markers = {'compile_commands.json', 'compile_flags.txt'}
}
