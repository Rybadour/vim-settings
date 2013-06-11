set tabstop=4
set shiftwidth=4
set cursorline
set rnu
set bs=2
set switchbuf=usetab
set smartindent
set incsearch
set hlsearch
set timeoutlen=2000
set wildmenu

" Keep the cursor away from the edge of the window
set scrolloff=10

nnoremap \ "_
nmap ,p :pu<CR>
nmap ,P :pu!<CR>
noremap gj <C-W>j<C-W>_
noremap gk <C-W>k<C-W>_

set noequalalways
nmap <F7> :NERDTree<CR>:set rnu<CR>
autocmd FileType nerdtree nmap C cdCR
autocmd FileType nerdtree nmap u u:cd ..<CR> 

set foldlevelstart=99

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

colorscheme desert
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

filetype indent on
