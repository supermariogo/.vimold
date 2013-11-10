"-------------------------------------------------------
"general configuration
"------------------------------------------------------
set nocompatible
set backspace=indent,eol,start "help bs
set ww=b,s,h,l,<,>,[,]  "help ww
set hlsearch
set autoindent       "auto indent, inherit from last row
set tabstop=4        " tab space=4
set softtabstop=4   " soft tab    
set shiftwidth=4    " aindent use 4 space
set cindent         " use c style indent
set showmatch       " auto match ()
filetype on "detect file type
filetype plugin on 
syntax enable
syntax on
set number "line number

"------------------------------------------------------
"GUI font settings
"------------------------------------------------------
if has("gui_running")
    set lines=28 columns=118 "gui mode set lines and colums
	set mousemodel=popup "GUI当右键单击窗口的时候，弹出快捷菜单"
    set guioptions-=T "Dont show the tools.
    " set guioptions-=m
    set winaltkeys=no "Alt组合键不映射到菜单上
    if has("gui_gtk2")
   :set guifont=Luxi\ Mono\ 12
   ":set guifontwide=STHeiti\ 14
    elseif has("x11") " Also for GTK 1
   :set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
    elseif has("gui_win32")
   :set guifont=Consolas:h12:cANSI
    endif
endif


"-----------------------------------------------------
"powerline configuration
"-----------------------------------------------------
set laststatus=2
set encoding=utf-8

"------------------------------------------------------
"auto complete plugin 
"------------------------------------------------------
" neocomplete
let g:neocomplcache_enable_at_startup=1
"omniCPP complete 
set completeopt=menu,menuone "关掉智能补全时的预览窗口
let OmniCpp_MayCompleteDot=1" autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with->
let OmniCpp_MayCompleteScope=1" autocomplete with ::
let OmniCpp_SelectFirstItem = 2 "select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1

"------------------------------------------------------
"win layout
"------------------------------------------------------
let g:NERDTree_title="[NERDTree]"
"let g:winManagerWindowLayout='FileExplorer|TagList'
"let g:winManagerWindowLayout="NERDTree"
let g:winManagerWindowLayout="NERDTree|TagList" 
function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
  
function! NERDTree_IsValid()  
    return 1  
endfunction 
nmap wm :WMToggle<cr>

"------------------------------------------------------
"ctags setting 按下F11重新生成tag文件，并更新taglist
"------------------------------------------------------
map <F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F11> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags "add current directory's generated tags file
set tags+=~/.vim/systags "add new tags file

nmap tn :tnext<cr>
nmap tp :tprev<cr>

"------------------------------------------------------
"taglist
"------------------------------------------------------
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:tlist_vhdl_settings = 'vhdl;d:package declarations;b:package bodies;e:entities;a:architecture specifications;t:type declarations;p:processes;f:functions;r:procedures'

"------------------------------------------------------
"MiniBufferExplorer 
"------------------------------------------------------
let g:miniBufExplMapWindowNavVim = 1 "ctrl +h j k l
let g:miniBufExplMapWindowNavArrows = 1 "ctrl + up down left right
let g:miniBufExplMapCTabSwitchBufs = 1 "ctrl+tab to change buf
"let g:miniBufExplMapCTabSwitchWindows = 1 " ctrl+tab move to next 
let g:miniBufExplModSelTarget = 1    " disable edit at uneditable win i..e. taglist win

"--fold setting--
"set foldmethod=syntax
"set foldlevel=100
"set foldcolumn=3

"------------------------------------------------------
"Auto Author
"------------------------------------------------------
let g:vimrc_author='Ze Mao' 
let g:vimrc_email='zemao@usc.edu' 
let g:vimrc_homepage='http://www-scf.usc.edu/~zemao/' 
 
nmap <A-1> :AuthorInfoDetect<cr>
"------------------------------------------------------
"quickfix
"------------------------------------------------------
map <silent><F5> <Esc>:w<CR>:make clean<CR>:cw<CR>
map <silent><F6> <Esc>:w<CR>:make <CR>:cw<CR>
map <F2> :copen<CR>
map <F3> :cp<CR>
map <F4> :cn<CR>

imap <silent><F5> <Esc>:w<CR>:make clean<CR>:cw<CR>
imap <silent><F6> <Esc>:w<CR>:make <CR>:cw<CR>
imap <F2> :copen<CR>
imap <F3> :cp<CR>
imap <F4> :cn<CR>
"quickfix for vhdl
"set errorformat=\*\*\ %tRROR:\ %f(%l):\ %m,\*\*\ %tRROR:\ %m,\*\*\ %tARNING:\ %m,\*\*\ %tOTE:\ %m,%tRROR:\ %f(%l):\ %m,%tARNING\[%*[0-9]\]:\ %f(%l):\ %m,%tRROR:\ %m,%tARNING\[%*[0-9]\]:\ %m

"------------------------------------------------------
"pyclwen settings
"------------------------------------------------------
"let g:pyclewn_args = "--args=-q --gdb=async --terminal=gnome-terminal,-x"
:map <A-v> :exe "Cdbgvar " . expand("<cword>") <CR>
:imap <A-v> :exe "Cdbgvar " . expand("<cword>") <CR>
"------------------------------------------------------
"windows sytle keyboard mapping
"------------------------------------------------------
map <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>
map <C-z> u
imap <C-z> <Esc>u
map <C-a> ggVG
imap <C-a> <Esc>ggVG

map <C-v> "+gP
imap <C-v> <Esc>"+gP
vmap <C-v> "+gP
map <C-c> "+y 
imap <C-c> <Esc>"+y
vmap <C-c> "+y
map <C-x> "+x
imap <C-x> <Esc>"+x
vmap <C-x> "+x
"------------------------------------------------------
"wrap 
"------------------------------------------------------
set nowrap 
map nw :set nowrap<cr>
map yw :set wrap<cr>
" D delete to end of the line 
"------------------------------------------------------
"NERD_commenter hotkey change 
"------------------------------------------------------
let NERD_c_alt_style = 0 " 将C语言的注释符号改为//, 默认是/**/
let NERDCompactSexyComs=1 " 多行注释时样子更好看
let NERDSpaceDelims=0 " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=0 " 多行注释时样子更好看
map <A-4> \ca 
map <A-2> \cc
imap <A-2> <Esc>\cc
vmap <A-2> \cs
map <A-3> \cu 
imap <A-3> <Esc>\cu
map <A-a> \cA
imap <A-a> <Esc>\cA 
"------------------------------------------------------
"vim abbreviations 
"------------------------------------------------------
iabbr NS next_state
iabbr CS current_state
iabbr "--- "-----------------------------------------------------
iabbr //*** //*****************************************************
iabbr ML My402List
iabbr fpfe fprintf(stderr,"");<left><left><left>
iabbr fpfi fprintf(stdin,"");<left><left><left> 
iabbr fpfo fprintf(stdout,"");<left><left><left> 
iabbr print printf("");<left><left><left>
