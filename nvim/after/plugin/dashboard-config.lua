local db = require('dashboard')

db.setup({
    theme = 'doom',
    config = {
        header = {
            '          _____                    _____          ',
            '         /\\    \\                  /\\    \\         ',
            '        /::\\    \\                /::\\    \\        ',
            '        \\:::\\    \\              /::::\\    \\       ',
            '         \\:::\\    \\            /::::::\\    \\      ',
            '          \\:::\\    \\          /:::/\\:::\\    \\     ',
            '           \\:::\\    \\        /:::/__\\:::\\    \\    ',
            '           /::::\\    \\       \\:::\\   \\:::\\    \\   ',
            '  ____    /::::::\\    \\    ___\\:::\\   \\:::\\    \\  ',
            ' /\\   \\  /:::/\\:::\\    \\  /\\   \\:::\\   \\:::\\    \\ ',
            '/::\\   \\/:::/  \\:::\\____\\/::\\   \\:::\\   \\:::\\____\\',
            '\\:::\\  /:::/    \\::/    /\\:::\\   \\:::\\   \\::/    /',
            ' \\:::\\/:::/    / \\/____/  \\:::\\   \\:::\\   \\/____/ ',
            '  \\::::::/    /            \\:::\\   \\:::\\    \\     ',
            '   \\::::/____/              \\:::\\   \\:::\\____\\    ',
            '    \\:::\\    \\               \\:::\\  /:::/    /    ',
            '     \\:::\\    \\               \\:::\\/:::/    /     ',
            '      \\:::\\    \\               \\::::::/    /      ',
            '       \\:::\\____\\               \\::::/    /       ',
            '        \\::/    /                \\::/    /        ',
            '         \\/____/                  \\/____/         ',
            ''
        },
        center = {
            {desc = "New file               SPC n f", desc_hl = 'String', action = "enew"},
            {desc = "Source init.vim        SPC v r", desc_hl = 'String', action = "source ~/.config/nvim/init.vim"},
            {desc = "Edit init.vim          SPC v e", desc_hl = 'String', action = "edit ~/.config/nvim/init.vim"},
            {desc = "Find file in dir       SPC o  ", desc_hl = 'String', action = "Files"},
            {desc = "Change colors          SPC c  ", desc_hl = 'String', action = "Colors"},
            {desc = "Recent files           SPC h  ", desc_hl = 'String', action = "History"},
            {desc = "Open git               SPC g  ", desc_hl = 'String', action = "Git"},
        },
        footer = {'We do what we must because we can :)'}
    }
})
