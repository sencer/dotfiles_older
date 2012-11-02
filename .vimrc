set nocompatible             
filetype off                
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"----------Various----------
" Bundle 'majutsushi/tagbar'
Bundle  'kshenoy/vim-signature'
Bundle 'vim-scripts/taglist.vim'
Bundle 'scrooloose/syntastic'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'vis'
Bundle 'sjl/gundo.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'godlygeek/tabular'
Bundle 'edsono/vim-matchit'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-scripts/cr-bs-del-space-tab.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-abolish'
Bundle 'grncdr/camelcasemotion'
Bundle 'tpope/vim-eunuch'
Bundle 'vim-scripts/SearchComplete'
Bundle 'sencer/vim-qespresso'
" Bundle 'vim-scripts/mark_tools'
" Bundle 'hotoo/calendar-vim'
"----------Visual----------
" Bundle 'bothra90/rainbow_parentheses.vim'
" Bundle 'kien/rainbow_parentheses.vim'
Bundle 'kshenoy/vim-rainbow_parentheses'
Bundle 'vim-scripts/wombat256.vim'
" Bundle 'tomasr/molokai'
Bundle 'Lokaltog/vim-powerline'
Bundle 'gnuplot.vim'
Bundle 'CSApprox'
"----------Completion----------
" Bundle 'oblitum/clang_complete'
Bundle 'Rip-Rip/clang_complete'
Bundle 'sencer/AutoComplPop'
" Bundle 'ervandew/supertab'
" Bundle 'Shuogo/neocomplcache'
Bundle 'SirVer/ultisnips'
Bundle 'sencer/snippets'
" Bundle 'garbas/vim-snipmate'
" Bundle 'honza/snipmate-snippets'
Bundle 'jiangmiao/auto-pairs'
" Bundle 'Townk/vim-autoclose'
" Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-endwise'
" Bundle 'vim-scripts/c.vim'
"----------Ruby-CSS-HTML---------
" Bundle 'astashov/vim-ruby-debugger'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ecomba/vim-ruby-refactoring'
" Bundle 'tpope/vim-rails'
Bundle 'vim-scripts/VIM-Color-Picker'
" Bundle 'sencer/vim-css-color'
" Bundle 'mattn/zencoding-vim'
" Bundle 'rstacruz/sparkup'
" Bundle 'chrisbra/color_highlight'
"----------Required for snipmate----------
" Bundle 'MarcWeber/vim-addon-mw-utils'
" Bundle 'tomtom/tlib_vim'
"----------End Bundle----------
filetype indent plugin on
"----------Appearence----------
colorscheme wombat256mod
" set ls=2 statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set ls=2
let g:nerdtree_tabs_open_on_gui_startup=0
hi Folded ctermfg=LightMagenta ctermbg=Black
hi Folded term=NONE cterm=NONE gui=NONE
set backspace=indent,eol,start 
set smartindent tabstop=2 shiftwidth=2 expandtab rnu pastetoggle=<F2> showmode
set incsearch hlsearch ignorecase smartcase
syntax on
nnoremap <F2> :set invpaste paste?<CR>
"----------Powerline Settings----------
let g:Powerline_symbols='unicode'
let g:Powerline_mode_n=' N '
let g:Powerline_mode_i=' I '
let g:Powerline_mode_v=' V '
let g:Powerline_mode_V=' V⋅L '
let g:Powerline_mode_cv=' V⋅B '
let g:Powerline_mode_s=' S '
let g:Powerline_mode_S=' S⋅L '
let g:Powerline_mode_cs=' S⋅B '
let g:Powerline_stl_path_style = 'short'
au BufEnter,BufNewFile call Pl#Theme#InsertSegment('currhigroup','after','filetype')
"----------AutoCommands----------
au BufNewFile,BufRead *.plt set ft=gnuplot commentstring=\#\ %s
au VimEnter * RainbowParenthesesToggleAll
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadChevrons
au BufRead,BufNewFile *.txt set ft=txt commentstring=\!\ %s
au InsertEnter * :set number
au InsertLeave * :set relativenumber
au FileType python set omnifunc=pythoncomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
"----------Tab settings----------
set swb=useopen,usetab,newtab
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
let notabs = 1
nnoremap <silent> <F8> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:set showtabline=0<Bar>:else<Bar>:tab ball<Bar>:set showtabline=2<Bar>:tabn<Bar>:endif<CR>
"----------AutoPairs----------
" let g:AutoPairsFlyMode = 1
" let g:AutoPairsShortcutBackInsert= '<C-b>'
"----------Clang Settings----------
let g:clang_auto_select=1
let g:clang_complete_auto=1
let g:clang_periodic_quickfix=1
" let g:clang_complete_copen=1
let g:clang_close_preview=1
let g:clang_hl_errors=1
let g:clang_use_library=1
let g:clang_complete_macros=1
let g:clang_complete_patterns=1
let g:clang_library_path='/usr/local/lib'
" let g:clang_user_options='2>/dev/null || exit 0'
let g:clang_snippets=1
let g:clang_snippets_engine='clang_complete'
let g:clang_conceal_snippets=1
set concealcursor=inv conceallevel=3
let g:clang_trailing_placeholder=1
"----------UltiSnips----------
py import sys; sys.path.append("/home/sselcuk/.vim/bundle/snippets/python/")
let g:UltiSnipsExpandTrigger="<tab>" 
let g:UltiSnipsJumpForwardTrigger="<tab>" 
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>" 
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetsDir="~/.vim/bundle/snippets/snippets/"
let g:UltiSnipsSnippetDirectories=["snippets"]
let g:UltiSnipsListSnippets='<C-L>'
"----------Syntastic----------
" let g:syntastic_c_check_header = 1
" let g:syntastic_cpp_check_header = 1
"----------Functions----------
  "----------Calculator----------
  let g:MyCalcPresition = 4
  " let g:MyCalcRounding = 1
  command! -nargs=+ MyCalc :echo MyCalc("<args>")
  vnoremap <Leader>=- :s/.\%V*/\=MyCalc(' -' . submatch(0))/<C-Left><C-Left><C-Left><Left>
  vnoremap <Leader>=+ :s/.\%V*/\=MyCalc(' +' . submatch(0))/<C-Left><C-Left><C-Left><Left>
  vnoremap <silent> <Leader>== :s/\%V.*/\=submatch(0) . " = " . MyCalc(submatch(0))/<CR>:noh<CR>
  vnoremap <silent> <Leader>=t y:echo MyCalc(substitute(@0,"*\n","+","g"))<CR>:silent :noh<CR>
  noremap <silent> <Leader>= :s/.*/\=MyCalc(submatch(0))/<CR>:noh<CR>
  noremap <silent> <Leader>== :s/.*/\=submatch(0) . " = " . MyCalc(submatch(0))/<CR>:noh<CR>
  imap <silent> \\   <Space><Left><ESC><C-v>iWygv"=MyCalc(@")<CR>Pa<Del>
  function! MyCalc(str)
    if exists("g:MyCalcRounding")
      return system("echo 'x=" . a:str . ";d=.5/10^" . g:MyCalcPresition
            \. ";if (x<0) d=-d; x+=d; scale=" . g:MyCalcPresition . ";print x/1' | bc -l")
    else
      return system("echo 'scale=" . g:MyCalcPresition . " ; print " . a:str . "' | bc -l")
    endif
  endfunction
  "----------FoldText----------
  set fcs=fold:\ 
  set foldtext=MyFoldText()
  function! MyFoldText()
    let indent_level = indent(v:foldstart)
    let indent = repeat(' ',indent_level)
    return indent.foldtext()
  endfunction
  function! TwiddleCase(str)
    if a:str ==# toupper(a:str)
      let result = tolower(a:str)
    elseif a:str ==# tolower(a:str)
      let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
    else
      let result = toupper(a:str)
    endif
    return result
  endfunction
  vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv
  "----------Switch File Type----------
  function! SwitchFT()
    if &ft == 'sh'
      set ft=awk.sh
    elseif &ft == 'awk.sh'
      set ft=txt
    elseif &ft == 'txt'
      set ft=sh
    elseif &ft == 'html'
      set ft=javascript
    elseif &ft == 'javascript'
      set ft=css
    elseif &ft == 'css'
      set ft=erb
    elseif &ft == 'erb'
      set ft=html
    endif
    set ft
  endfunction
  nnoremap <leader>f :call SwitchFT()<cr>
"----------Underline the Word Under Cursor----------
  let g:underline_cursor_word=0
  function! Uline()
    let g:underline_cursor_word=!g:underline_cursor_word
    if g:underline_cursor_word
      exe printf('match Underlined /\V\<%s\>/', escape(expand('<cword>'), '/\'))
      aug uline
        au CursorMoved * exe printf('match Underlined /\V\<%s\>/', escape(expand('<cword>'), '/\'))
      aug END
    else
      match
      aug uline
        au! 
      aug END
      aug! uline
    endif
  endfunction
  nnoremap <Leader>[ :call Uline()<CR>
"----------Mappings----------
imap <A-BS> <C-u>
imap <C-BS> <C-w>
nnoremap  ; :
vnoremap  ; :
nnoremap <F2> :set invpaste paste?<CR>
nnoremap <F5> :GundoToggle<CR>
nmap <F9> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
" nmap <F9> :TagbarToggle<CR>
nnoremap <leader>] :set hlsearch! hlsearch?<CR>
nnoremap <Leader>t :NERDTreeMirrorToggle<CR>
nnoremap <S-Down> zj
nnoremap <S-Left> zc
nnoremap <S-Right> zo
nnoremap <S-Up> zk
noremap [1;5k <C-w>>
noremap [1;5m <C-w><
noremap <leader>ev :vsplit $MYVIMRC<cr>
noremap <silent><leader>p :!gnuplot %<CR>
noremap <silent> ,, :set cul! cuc!<CR>
nmap \\\ gccj
vmap \\ gc
vnoremap < <gv
vnoremap > >gv
nnoremap Y y$
nnoremap / /\v
vnoremap / /\v
cnoremap %s %s/\v
nnoremap <Leader>cc :copen<CR>
nnoremap <Leader>c :cclose<CR>
nmap <Leader>cU :ColorHighlight!<CR>

" Bundle 'ReloadScript'
" Bundle 'TabLineSet.vim'
" Bundle 'project.tar.gz'
" Bundle 'hail2u/vim-css3-syntax'
" Bundle 'tpope/vim-speeddating'
" Bundle 'tpope/vim-afterimage'
" Bundle 'tpope/vim-fugitive'
" if has("gui_running") 
" endif 
  " let &t_ti.="\e[?7727h"
  " let &t_te.="\e[?7727l"
  " noremap <Esc>O[ <Esc>
  " noremap! <Esc>O[ <Esc>
	" let &t_SI = "\<Esc>[0 q"  changes the cursor shape
	" let &t_EI = "\<Esc>[3 q"  for some terminals
" let &t_SI="\<Esc>]12;orange\x7"
" let &t_EI="\<Esc>]12;red\x7"

" au VimLeave * silent !echo -ne "\033]111\007"
