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
call LspOptionsSet(#{
            \   noNewlineInCompletion: v:true,
            \   outlineWinSize: 40,
            \   semanticHighlight: v:true,
            \   showDiagWithVirtualText: v:true,
            \   })

" maps
let mapleader=","
let maplocalleader=","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap <c-u> <esc>vawU<esc>ei
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>

" fzf commands
nnoremap <localleader>ff :Files<cr>
nnoremap <localleader>fb :Buffers<cr>
nnoremap <localleader>fg :GFiles<cr>
nnoremap <localleader>fl :Lines<cr>
nnoremap <localleader>fj :Jumps<cr>
nnoremap <localleader>fm :Maps<cr>

" lsp commands
nnoremap <c-k>r :LspRename<cr>
nnoremap <c-k>s :LspSymbolSearch<cr>
nnoremap <c-k>g :LspGotoDefinition<cr>
nnoremap <c-k>pd :LspPeekDefinition<cr>
nnoremap <c-k>pr :LspPeerReferences<cr>
nnoremap <c-k>h :LspHover<cr>
nnoremap <c-k>ds :LspDiagShow<cr>
nnoremap <c-k>dc :LspDiagCurrent<cr>
nnoremap <c-k>dn :LspDiagNext<cr>
nnoremap <c-k>dp :LspDiagPrev<cr>
nnoremap <c-k>f :LspFormat<cr>
nnoremap <c-k>o :LspOutline<cr>

" git-gutter
" <leader>hs -- stage hunk
" <leader>hu -- undo hunk
" <leader>hp -- preview hunk
set updatetime=500
nnoremap <localleader>hh :GitGutterLineHighlightsToggle<cr>
nmap [h <Plug>(GitGutterPrevHunk)
nmap ]h <Plug>(GitGutterNextHunk)

" NERD Tree
nnoremap <localleader>to :NERDTree<cr>
nnoremap <localleader>tc :NERDTreeClose<cr>
nnoremap <localleader>tt :NERDTreeToggle<cr>

" NERD Commenter
" <leader>cc -- comment line or selected
" <leader>cn -- same, but force nesting
" <leader>c<space> -- toggle comment state
" <leader>cm -- comment with multipart delimiters
" <leader>ci -- toggle comment state? (clarify)
" <leader>cs -- comment lines with pretty formatting
" <leader>cy -- yank lines + cc
" <leader>c$ -- comment from cursor to eol
" <leader>cA -- append comment to eol
" <leader>ca -- alter delimiters type
" <leader>cu -- uncomment
" <leader>cl -- cc + align left
" <leader>cb -- cc + align both
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Tagbar
nnoremap <localleader>b :TagbarToggle<cr>
