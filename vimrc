set tabstop=4
set shiftwidth=4
set cursorline
set rnu
set bs=2
set switchbuf=usetab
nnoremap \ "_
map #1 "_deP
map #2 "_di)P
map #3 "_di"P
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
set smartindent

" Syntax highlighting
syntax on
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

" Indigo and Lgp
au BufNewFile,BufRead *.py set tabstop=2
au BufNewFile,BufRead *.py set shiftwidth=2
au BufNewFile,BufRead *.py set expandtab

au BufNewFile,BufRead */Spider-Fish/* set tabstop=2
au BufNewFile,BufRead */Spider-Fish/* set shiftwidth=2
au BufNewFile,BufRead */Spider-Fish/* set expandtab
au BufNewFile,BufRead */Spider-Fish/* nmap <F6> $i<Enter><Esc>
