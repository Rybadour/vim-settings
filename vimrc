set tabstop=4
set shiftwidth=4
set cursorline
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
set formatoptions=jcro
set textwidth=100

" Keep the cursor away from the edge of the window
set scrolloff=10

nnoremap \ "_
nmap ,p :pu<CR>==
nmap ,P :pu!<CR>==
noremap gj <C-W>j<C-W>_
noremap gk <C-W>k<C-W>_
noremap <ScrollWheelUp> gk
noremap <ScrollWheelDown> gj
" Makes cw consistent with everyother use of w (as motion)
nmap cw dwi
" Toggles # buffers on <TAB>
nmap <TAB> :e#<CR>

set noequalalways
nmap <F7> :NERDTreeFind<CR>:set rnu<CR>

"Sourced from vim tip: http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

set foldlevelstart=99

execute pathogen#infect()

"Airline config
let g:airline_detect_whitespace=0
let g:airline_powerline_fonts = 1

filetype plugin on

" Redefine s as our replace operator
map s <Plug>(operator-replace)

" Better tabpage controls
	" Show tab numbers
	set guitablabel=%N/\ %t\ %M

	" more conveinent mapping for go to nth tab
	map gn :tabn

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
let tlist_haxe_settings='haxe;f:function;v:variable;c:class;i:interface;p:package'

" Twigs in Kohana projects
au BufNewFile,BufRead *.html set filetype=twig

" Override text bg for lines longer than 80
highlight OverLength guibg=#503333
match OverLength /\%81v.\+/

" Highlight a trailing colon pink (should be semi-colon)
highlight OverLength guibg=#FFDDDD
match OverLength /:$/

filetype indent on

let g:startify_custom_header = [
	\ ' ',
	\ ' ',
	\ ' ',
	\ ' ',
	\ ' ',
	\ ' ',
	\ '',
	\ '',
	\ ]

let g:startify_list_order = [
	\ ['   My last recently', '   opened files'],
	\ 'files',
	\ ['   My last recently modified files in the current directory:'],
	\ 'dir',
	\ ['   These are my sessions:'],
	\ 'sessions',
	\ ['   These are my bookmarks:'],
	\ 'bookmarks',
	\ ]

" Vaxe configs
let g:vaxe_prefer_hxml = 'compile.hxml'

" Syntastic configs
let g:syntastic_mode_map = { 'mode': 'passive',
						   \ 'active_filetypes': [],
						   \ 'passive_filetypes': ['haxe'] }
