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
let g:airline_symbols.colnr=' col:'
let g:airline_symbols.linenr=' ln:'

" lsp
packadd lsp
call LspAddServer([#{
            \   name: 'pylsp',
            \   filetype: 'python',
            \   path: '/usr/bin/pylsp',
            \   args: [],
            \   }])
call LspAddServer([#{
            \   name: 'clangd',
            \   filetype: ['c', 'cpp'],
            \   path: '/usr/bin/clangd',
            \   args: ['--background-index', '--clang-tidy']
            \   }])

" maps
let mapleader=","
let maplocalleader=","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap _ ddkP
nnoremap - ddp
inoremap <c-u> <esc>vawU<esc>ei
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>

augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END

augroup filetype_cpp
    autocmd!
    autocmd FileType cpp nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType cpp :iabbrev <buffer> iff if ()<left>
augroup END

nnoremap <F2> :LspRename<cr>
nnoremap <c-k>r :LspRename<cr>
nnoremap <F3> :LspSymbolSearch<cr>
nnoremap <c-k>s :LspSymbolSearch<cr>
nnoremap <c-k>g :LspGotoDefinition<cr>
nnoremap <c-k>p :LspPeekDefinition<cr>
nnoremap <c-k>h :LspHover<cr>
nnoremap <c-k>d :LspDiagCurrent<cr>
nnoremap <c-k>n :LspDiagNext<cr>
nnoremap <c-k>N :LspDiagPrev<cr>
nnoremap <c-k>f :LspFormat<cr>
nnoremap <c-k>o :LspOutline<cr>
