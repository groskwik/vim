" Various options ------------------------------------------------- "
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

colorscheme molokai                  " color theme form sublime_text
let g:rehash256 = 1                  " color for terminal
let g:molokai_original = 1           " orgiginal background (less dark)
set nu!                              " count lines
set backspace=indent,eol,start       " allow backspacing over everything in insert mode
set history=50                       " keep 50 lines of command line history
set ruler                            " show the cursor position all the time
set showcmd                          " display incomplete commands
set incsearch                        " do incremental searching
set autoread                         " update file if modified by an external program
set guifont=consolas:h10
set ignorecase                       " ignore case when searching
set smartcase                        " try to be smart with case when searching
set foldcolumn=1                     " add a bit extra margin to the left
set guioptions-=T                    " remove toolbar
set tabstop=4 shiftwidth=4 expandtab " set tab to 4, reindent size, replace tab with space
set wrap!                            " disable wrap
set cursorline                       " highlight current line
set nrformats=alpha                  " enable visual increment
set clipboard=unnamed                " share the clipboard
source $VIMRUNTIME/vimrc_example.vim


"------------Start Python PEP 8 stuff----------------
"
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
"au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
"autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za 

"----------Stop python PEP 8 stuff--------------

"
let NERDTreeIgnore=['\.pyc$', '\~$', '\.png$', '\.pdf$'] "ignore files in NERDTree

let g:pymode = 0 " turn off pymode
let g:pymode_folding = 1
let g:pymode_syntax_all = 1 " enable all Python syntax highlighting features
let g:pymode_options = 1 " enable default options for pymode 

let g:airline#extensions#tabline#enabled = 1   "enable airline plugin
let g:airline_theme='dark'                  " vim_airline theme
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"let g:airline_powerline_fonts = 1              "display the powerline font symbols in vim_airline 
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.crypt = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = 'b'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.spell = 's'
let g:airline_symbols.notexists = 'x'
let g:airline_symbols.whitespace = 'Ξ'

let g:indent_guides_enable_on_vim_startup = 0  " enable indent guide plugin
let g:indent_guides_guide_size = 1             
let g:indent_guides_color_change_percent = 5 
let g:indentLine_enabled = 1
command! Dos2unix set ff=unix | %s/\r//g

" Ctrl-Y for yanking into the clipboard 
" and Ctrl-q to paste from the clipboard.
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-q> "+gP
vnoremap <C-q> "+gP


if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" directory match the current opened file
set autochdir
" Hide toolbar
" set guioptions-=T
" set path=C:\
"
" Windows size
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=50 columns=100
  set foldcolumn=1                     " add a bit extra margin to the left
  " directory match the current opened file
  set autochdir
else
  " This is console Vim.
"  if exists("+lines")
"    set lines=50
"  endif
"  if exists("+columns")
"    set columns=100
"  endif
endif
"
" Latex suite options----------------------------------------------
"
" pdflatex by default for latex suite
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
let g:Tex_ViewRule_pdf = 'SumatraPDF'
"
"  win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash
"
" grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" GNUPLOT --------------------------------------------------------"
"
" associate F5 to gnuplot and ShiftF5 to pgnuplot
if has("gui_running")
autocmd FileType gnuplot map <F5> :! chcp 1252 & "C:\Program Files (x86)\gnuplot\bin\gnuplot.exe" % <cr>
else
autocmd FileType gnuplot map <F5> :! "C:\Program Files (x86)\gnuplot\bin\gnuplot.exe" % <cr>
endif
autocmd FileType gnuplot map <S-F5> :! "C:\Program Files (x86)\gnuplot\bin\wgnuplot.exe" % <cr>

" R script --------------------------------------------------------
"associate R to F7
autocmd FileType R map <F7> :! C:\PROGRA~1\R\R-31~1.1\bin\Rscript.exe "%:p" <cr>

" Python 3 --------------------------------------------------------
"associate iPython3 to F3
autocmd FileType python map <F3> :! "C:\Users\bdulauroy\Documents\Work\Apps\WinPython-64bit-3.3.5.0\python-3.3.5.amd64\scripts\ipython.exe" -i % <cr>
" associate python and clam to F2
autocmd FileType python map <F2> :Clam C:\Users\bdulauroy\Documents\Work\Apps\WinPython-64bit-3.3.5.0\python-3.3.5.amd64\python.exe %  <cr>

" NERDTree plugin -------------------------------------------------
nnoremap <silent> <F8> :NERDTree<CR>

" Conqueterm plugin -----------------------------------------------
" nnoremap <silent> <F9> :ConqueTermVSplit cmd<CR>

" Using diff command in windows environnment ----------------------
"set diffexpr=MyDiff() For vim prior to version 8.X
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

let g:LustyExplorerSuppressRubyWarning = 1

set nobackup	

":set colorcolumn=79
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" move among buffers with CTRL
map <C-L> :bnext<CR>
map <C-K> :bprev<CR>

"Remove all trailing whitespace by pressing F4
nnoremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""
