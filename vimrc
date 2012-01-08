filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
highlight Tab ctermbg=darkgreen guibg=darkgreen
autocmd Syntax * syn match ExtraWhitespace /\s\+$/
autocmd Syntax * syn match Tab /\t\+/

autocmd BufWinLeave * call clearmatches()

" to fold and unfold code
set foldmethod=indent
set foldlevel=99

set ai "Auto indent
" set si "Smart indet
set wrap "Wrap lines

set ts=4 "4 space tab
set expandtab "tabs per spaces

" change the default mapping firs key from \ to ,
let mapleader=','

cabbrev lvim
    \ lvim /\<lt><C-R><C-W>\>/gj
    \ *<C-R>=(expand("%:e")=="" ? "" : ".".expand("%:e"))<CR>
    \ <Bar> lw
    \ <C-Left><C-Left><C-Left>

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Warn if the line is too long
set colorcolumn=80

set number "show line numbers
set ruler "show statusbar with line,column

"set showmatch "highlight the pair og brackes/parenthesis
"set mat=2 "How many tenths of a second to blink
set nocompatible "ignore old vim restrictions
set hid "Change buffer - without saving
set ignorecase "ignore case when searching
set smartcase
set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers
set magic "Set magic on, for regular expressions

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/home/cascara/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction



" Minibuffer explorer config
let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


" ctags location
let Tlist_Ctags_Cmd='/usr/bin/ctags'

" TaskList config
map T :TaskList<CR>
map P :TlistToggle<CR>

" TagList config
" Display function name in status bar:
let g:ctags_statusline=1
" Automatically start script
let generate_tags=1
" Displays taglist results in a vertical window:
let Tlist_Use_Horiz_Window=0
" Shorter commands to toggle Taglist display
nnoremap TT :TlistToggle<CR>
map <F4> :TlistToggle<CR>
" Various Taglist diplay config:
"let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_File_Fold_Auto_Close = 1

" pydiction config
" set to <S-T>
filetype plugin on
let g:pydiction_location = '/home/cascara/.vim/pydiction-1.2/complete-dict'

" Provide a simple way to switch buffers
map <c-left> :bp<CR>
map <c-right> :bn<CR>
" map <c-left> :tabprevious<CR>
" map <c-right> :tabnext<CR>
