set nocompatible
if has("gui_running")
endif
" Mouse mapping
" open file under cursor
"imap <2-LeftMouse> <ESC>:vs <cword><cr> 
" highlight word under cursor
"imap <2-LeftMouse> <ESC><v><cword>

" Nocompatible mode
set nocompatible

" Show line number
set number

" highlight current line under cursor
"set hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"set hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
set cursorline

" reload file
map <F5> :edit!<cr>

" fold Method
set fdm=syntax

map gf <C-w> gf
map bd :bd<cr>
" open new tab instead of buffer
":au BufAdd,BufNewFile,BufRead * nested tab sball
"set guioptions-=m  "remove menu bar
"set guioptions-=T  "remove toolbar

" tabs highlight
"autocmd syntax * SpaceHi
map <F3> :so ~/.vim/manualplugin/spacehi.vim <cr>:ToggleSpaceHi<cr>

"let g:spacehi_tabcolor="ctermfg=1 cterm=underline"
let g:spacehi_tabcolor="ctermbg=1 ctermbg=gray"
"let g:spacehi_tabcolor=g:spacehi_tabcolor . " guifg=red gui=underline"
let g:spacehi_tabcolor=g:spacehi_tabcolor . " guibg=DarkGray"
let g:spacehi_spacecolor="ctermbg=4 cterm=underline"
"let g:spacehi_spacecolor=g:spacehi_spacecolor . " guifg=blue gui=underline"
let g:spacehi_spacecolor=g:spacehi_spacecolor . " guibg=LightGray"


" find and highligh timestamps in logs
"autocmd syntax * TimestampHi
"map TimeStampHi to F4
map <F4> :so ~/.vim/manualplugin/timestamphi.vim <cr>:ToggleTimestampHi<cr>
"map <F5> /[0-9][0-9]-\a\a\a-\d\d\d\d::\d\d:\d\d:\d\d\\|\a\a\a \d\d \d\d:\d\d:\d\d \d\d\d\d\|^\[[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9].*\]<cr>
"

" map and load ShowFunc plugin
""map <F1> :so ~/.vim/manualplugin/ShowFunc.vim<cr>:call <SNR>23_ShowFuncOpen()<CR>
" enable taglist window for C files
au FileType c,cpp let Tlist_Auto_Open=1
map <F1> :so ~/.vim/manualplugin/taglist.vim<cr>:TlistToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
"filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Open explorer
nmap e :Explore<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 2 lines to the cursor - when moving vertically using j/k
set so=2

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
"set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=4

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme desert
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif
set guifont=Monospace\ 10
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=8

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent

" toggle wrap/nowrap for lines
map <F12> :set wrap!<cr>

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose!<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l Column:\
set statusline=%F%m%r%h%w\ [CWD=%{getcwd()}]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [TotalStrings=%L] 
"set statusline=%F%m%r%h%w\ [%{getcwd()}]\ [pos=%l,%v][%p%%]\ [Lines=%L] 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" user defined
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
" close tab as in all editors/browsers ctrl+w
" map <C-w> :tabclose<cr>

" ctags mapping and stuffs
map <F8> :! /home/devl/.vim/scripts/gen_ctags.sh *<CR>
"map <F8> :silent !ctags -R *<CR>

imap <C-s> <ESC>:w<cr>a
nmap <C-s> :w<cr>

" delete all from cursor to end of line
imap <C-k> <ESC><Right>d$a
nmap <C-k> d$

" delete word backward as in insert mode
"nmap <C-w-w> i<C-w><ESC>

" delete word under cursor
nmap <C-u> ciw<ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""useful commands, not included
" highlight line numbers
"highlight LineNr guibg=grey
"highlight LineNr guifg=grey
"highlight LineNr ctermfg=grey
"
" Search for selected text.
" http://vim.wikia.com/wiki/VimTip171
"let s:save_cpo = &cpo | set cpo&vim
"if !exists('g:VeryLiteral')
"  let g:VeryLiteral = 0
"endif
"function! s:VSetSearch(cmd)
"  let old_reg = getreg('"')
"  let old_regtype = getregtype('"')
"  normal! gvy
"  if @@ =~? '^[0-9a-z,_]*$' || @@ =~? '^[0-9a-z ,_]*$' && g:VeryLiteral
"    let @/ = @@
"  else
"    let pat = escape(@@, a:cmd.'\')
"    if g:VeryLiteral
"      let pat = substitute(pat, '\n', '\\n', 'g')
"    else
"      let pat = substitute(pat, '^\_s\+', '\\s\\+', '')
"      let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
"      let pat = substitute(pat, '\_s\+', '\\_s\\+', 'g')
"    endif
"    let @/ = '\V'.pat
"  endif
"  normal! gV
"  call setreg('"', old_reg, old_regtype)
"endfunction
"vnoremap <silent> * :<C-U>call <SID>VSetSearch('/')<CR>/<C-R>/<CR>
"vnoremap <silent> # :<C-U>call <SID>VSetSearch('?')<CR>?<C-R>/<CR>
"vmap <kMultiply> *
"nmap <silent> <Plug>VLToggle :let g:VeryLiteral = !g:VeryLiteral
"  \\| echo "VeryLiteral " . (g:VeryLiteral ? "On" : "Off")<CR>
"if !hasmapto("<Plug>VLToggle")
"  nmap <unique> <Leader>vl <Plug>VLToggle
"endif
"let &cpo = s:save_cpo | unlet s:save_cpo


" Search for selected text, forwards or backwards.
"vnoremap <silent> * :<C-U>
"  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
"  \gvy/<C-R><C-R>=substitute(
"  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
"  \gV:call setreg('"', old_reg, old_regtype)<CR>
"vnoremap <silent> # :<C-U>
"  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
"  \gvy?<C-R><C-R>=substitute(
"  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
"  \gV:call setreg('"', old_reg, old_regtype)<CR>
