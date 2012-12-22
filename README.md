vim-settings
============

My personal vim settings and plugins.

Plugins Used
------------

* **operator-replace**: http://www.vim.org/scripts/script.php?script_id=2782
* **camelcasemotion**: http://www.vim.org/scripts/script.php?script_id=1905

Notable Sections
----------------

###Tab Controls
  
    " more conveinent mapping for previous tab
    map ge gT
  
    " return to last visited tab
    map gr :exe "tabn " . g:ltv<CR>
  
    " more conveinent mapping for go to nth tab
    map gn :tabn
  
  
###Relative Line Numbering
  
    " Vim 7.3 or newer
    set rnu
  

###Highlight Find Search Match While Writing Pattern

    " Makes writing complicated patterns much easy
    set incsearch
  
  
###Fullscreen Gvim and remove toolbars

    set guioptions-=m
    set guioptions-=T
    au GUIEnter * simalt ~x
