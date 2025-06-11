set nocompatible
filetype plugin on
syntax on
filetype indent on

set number
set cursorline

set tabstop=4
set shiftwidth=4
set expandtab

set incsearch
set hlsearch

set list
set listchars=tab:--,trail:.,extends:>,precedes:<
set lcs+=space:·

set t_u7=
set encoding=utf8

" gruvbox
colorscheme gruvbox
set background=dark

" vim-airline
let g:airline_theme='base16'
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
let g:airline_symbols.maxlinenr=''
let g:airline_symbols.colnr=' col:'
let g:airline_symbols.linenr=' ln:'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.notexists = '∄'

" lsp
packadd lsp
call LspAddServer([#{
            \   name: 'clangd',
            \   filetype: ['c', 'cpp'],
            \   path: '/usr/bin/clangd',
            \   args: ['--background-index', '--clang-tidy']
            \   }])
call LspAddServer([#{
            \   name: 'pylsp',
            \   filetype: 'python',
            \   path: '/usr/bin/pylsp',
            \   args: []
            \   }])

nnoremap <F12> :LspGotoDefinition<cr>
