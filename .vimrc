" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=eol,indent,start

" Make a backup before overwriting a file.  The backup is removed 
" after the file was successfully written
set writebackup

set ruler		" Show the cursor position all the time 
set expandtab		" Let tabs be tabs
set showmatch		" Match Parens
set matchtime=500	" Match for half a second
set autoindent		" Always have autoindenting on
"set cindent		" Use C-style rules for indentation
set shiftwidth=2	" Autoindenting uses this spacing
set tabstop=2		" Show tabs as 4 spaces
set pastetoggle=<F3>	" Toggle our paste mode to not indent
"set foldmethod=syntax	" Fold on syntax by default
set smarttab
set shiftround
set incsearch

" Make vim smart
syntax on
filetype plugin on
filetype indent on

" Spell check is wicked awesome
"set spell spelllang=en_us

set background=dark
"colorscheme ir_black
"colorscheme paintbox 
colorscheme solarized
set guifont=Monaco:h12




" Fix the damn typos
command! Q  quit
command! W  write
command! Wq wq
command! WQ wq
command! Qa qa
command! QA qa
command! Wqa wqa
command! WQa wqa
command! WQA wqa

"" Configure mini buffer explorer
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:umniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"map <Leader>b :MiniBufExplorer<cr>

" If I paste and indentation gets fsck'd:
inoremap <silent> <C-g> <ESC>u:set paste<CR>.:set nopaste<CR>gi

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>


" generate tags"
au BufWritePost .c,.cpp,*.h silent! !ctags -R &

" For twiki syntax folding
let g:Twiki_FoldAtHeadings = 1

" Break a line
map <Leader>f 072lBi<cr><esc>

" Java
au FileType java set ts=2
au FileType java set shiftwidth=2
au FileType java syntax clear javaBraces
au FileType java syn region javaBraces start="{" end="}" transparent fold

" Makefiles don't like spaces
au FileType make set noexpandtab

" Fold Conf Files
au FileType conf syn region confBraces start="{" end="}" transparent fold

" I rarely write old-style sh. It's almost always bash:
let is_bash="true"

"if has("gui_running")
"set guifont=Monaco
"endif

" Spell-related options
if has("spell")
    set spell spelllang=en
    au FileType apache set spell nospell
    au FileType conf set spell nospell
    au FileType make set spell nospell
endif


"t = Auto-wrap text using textwidth
"c Auto-wrap comments using textwith, inserts comment leader
"r Autoinsert comment leader in insert mode
"q allow formatting of comments with 'gq'
"a autoformatting of paragraphs
"n recognize numbered lists when formatting text
"2 use the indentation of the second line of the paragraph to format the
"  paragraph
"b auto-wrap at blanks at or before 'textwidth'
"l long lines are not broken in insert mode (!!)
set formatoptions=cqnb

" System dictionary file (C-x C-k)
set dictionary=/usr/share/dict/words

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
" Run latex, then dvipdf, then refresh the xpdf window.
" let g:Tex_FormatDependency_pdf = 'pdf'
" let g:Tex_CompileRule_pdf = 'ps2pdf-dSubsetFonts=true -dEmbedAllFonts=true $*.ps'
" let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*' 
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_DefaultTargetFormat = 'pdf'
" Set the target format to pdf.


map , :FufFile<cr>
map ; :FufBuffer<cr>
map <C-a>n :bn!<cr>
map <C-a>p :bp!<cr>
map <C-a><C-n> :bn!<cr>
map <C-a><C-p> :bp!<cr>
