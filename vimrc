set tabstop=4
set shiftwidth=4
set cursorline
set cursorcolumn
set rnu
set number
set bs=2
set switchbuf=usetab
set smartindent
set incsearch
set hlsearch
set timeoutlen=800
set wildmenu
set laststatus=2
set formatoptions=jcr
set textwidth=100
set tags=./tags;
set foldmethod=indent

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Keep the cursor away from the edge of the window
set scrolloff=10

nmap ~ ~h
nnoremap \ "_
nmap ,p :pu<CR>==
nmap ,P :pu!<CR>==
noremap gj <C-W>j<C-W>_
noremap gk <C-W>k<C-W>_
noremap <ScrollWheelUp> gk
noremap <ScrollWheelDown> gj
nmap gV `[v`]
" Makes cw consistent with everyother use of w (as motion)
nmap cw dwi
" Make sure I can leave buffer without saving, also it maintains undo history
set hidden
" Toggles # buffers on <TAB>
nmap <TAB> :e#<CR>
" Toggles current fold on <Space>
nmap <Space> za

nmap cc <Plug>(change-now)

set noequalalways
nmap <F7> :NERDTreeFind<CR>:set rnu<CR>

"Sourced from vim tip: http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
"autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
"autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

set foldlevelstart=99

" Teaching myself to not use dumb things
map R <Nop>
map x <Nop>

" GG no rere
noremap d "_d
noremap c "_c

noremap r d

execute pathogen#infect()

"Airline config
let g:airline_detect_whitespace=0
let g:airline_powerline_fonts = 1

filetype plugin on

" Redefine s as our replace operator
map s <Plug>(operator-replace)

" Redefine l and L as line text objects
call textobj#user#plugin('line', {
\      '-': {
\        'select-a': 'l', '*select-a-function*': 'textobj#line#select_a',
\        'select-i': 'L', '*select-i-function*': 'textobj#line#select_i',
\      },
\    })

" Better tabpage controls
	" Show tab numbers
	set guitablabel=%N/\ %t\ %M

	" more conveinent mapping for previous tab
	map ge gT

	" return to the last tab page visited.
	" Courtesy of S. Cowles (http://vim.1045645.n5.nabble.com/jump-to-last-visited-tabpage-td1172955.html)
		map gr :exe "tabn " . g:ltv<CR>

		" referred to by TabLeave autocmd.
		function! Setlasttabpagevisited()
			let g:ltv = tabpagenr()
		endfunction

		augroup localtl
		" Remove all localtl autocommands
		au!
		" keep tally of the last tab page visited.
		autocmd TabLeave * call Setlasttabpagevisited()
		augroup END
		autocmd VimEnter * let g:ltv = 1

" Configure Gvim to fullscreen
set guioptions-=m
set guioptions-=T
au GUIEnter * simalt ~x

" CTags related stuff
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Syntax highlighting
syntax on
au BufNewFile,BufRead *.md set filetype=markdown

set bg=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_italic=0
colorscheme solarized

hi Number guifg=Orange
hi Boolean guifg=Orchid
hi Statement guifg=indianred

hi haxeParen guifg=yellowgreen
hi haxeParenT1 guifg=yellowgreen
hi haxeParenT guifg=yellowgreen
hi haxeParen1 guifg=yellowgreen
hi haxeParenT2 guifg=yellowgreen
hi haxeParen2 guifg=yellowgreen

" Haxe stuff
filetype on
au BufNewFile,BufRead *.hx set filetype=haxe
" Omnicomplete in haxe requires autowrite
au BufNewFile,BufRead *.hx set autowrite
au BufNewFile,BufRead *.hx nmap <F6> :call vaxe#Ctags()<CR>:! ctags -R --languages=haxe<CR>
let tlist_haxe_settings='haxe;f:function;v:variable;c:class;i:interface;p:package'

" Twigs in Kohana projects
au BufNewFile,BufRead *.html set filetype=twig

" Less Css easy complitation
au BufNewFile,BufRead *.less nmap <F6> :! lessc %<CR><CR>

" Override text bg for lines longer than 80
highlight OverLength guibg=#503333
match OverLength /\%81v.\+/

" Highlight a trailing colon pink (should be semi-colon)
highlight OverLength guibg=#FFDDDD
match OverLength /:$/

filetype indent on

let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = [
    \ '                                            ',
	\ '   ___   ____.__      _________      _____  ',
	\ '  \   \ /   /|__| ____\______  \    /  |  | ',
	\ '   \   Y   / |  |/     \  /    /   /   |  |_',
	\ '    \     /  |  |  Y Y  \/    /   /    ^   /',
	\ '     \___/   |__|__|_|  /____/ /\ \____   | ',
	\ '                      \/       \/      |__| ',
    \ '                                            ',
    \ '        ___                                 ',
	\ '    _.-|   |          |\__/,|   (`\         ',
	\ '   {   |   |          |o o  |__ _) )        ',
	\ '    "-.|___|        _.( T   )  `  /         ',
	\ '     .--`-`-.     _((_ `^--` /_<  \         ',
	\ '   .+|______|__.-||__)`-`(((/  (((/         ',
    \ '                                            ',
    \ '                                            ',
	\ ]

let g:startify_list_order = [
	\ ['   My last recently', '   opened files'],
	\ 'files',
	\ ['   My last recently', '   dir'],
	\ 'dir',
	\ ['   These are my sessions:'],
	\ 'sessions',
	\ ['   These are my bookmarks:'],
	\ 'bookmarks',
	\ ]

" Vaxe configs
let g:vaxe_prefer_hxml = 'compile.hxml'

" Syntastic configs
au BufNewFile,BufRead *.js nmap <F6> :SyntasticCheck<CR>
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_php_phpcs_args='--standard=Squiz'
let g:syntastic_mode_map = { 'mode': 'passive',
						   \ 'active_filetypes': ['javascript', 'php', 'jsx'],
						   \ 'passive_filetypes': ['haxe', 'd'] }

let g:syntastic_d_compiler_options = '$(pkg-config --cflags --libs gtkd2)'

" Tagbar configs
let g:tagbar_show_linenumbers = 2

" Make sure redrawing is lazy
set lazyredraw

" CtrlP Settings
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Less Css settings
let g:lesscss_save_to = '../css/'

" After text object mappings
autocmd VimEnter * call after_object#enable('=', ':', '-', '*', '>', ' ', ';')

" Enable project specific vimrc's
set exrc
set secure
