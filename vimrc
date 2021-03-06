let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim', {
            \ 'autoload' : {'filetypes' : 'python'}
            \ })
call dein#add('Shougo/neosnippet.vim') 
call dein#add('Shougo/neosnippet-snippets') 
call dein#add('itchyny/lightline.vim') 
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('Townk/vim-autoclose') 
call dein#add('honza/vim-snippets') 
call dein#add('ujihisa/neco-look') 
call dein#add('tpope/vim-surround') 
call dein#add('tpope/vim-haml') 
call dein#add('tpope/vim-endwise') 
call dein#add('ctrlpvim/ctrlp.vim') 
call dein#add('thinca/vim-ref') 
call dein#add('slim-template/vim-slim') 
call dein#add('szw/vim-tags') 
call dein#add('scrooloose/syntastic') 
call dein#add('cespare/vim-toml') 
call dein#add('Shougo/unite.vim') 
call dein#add('Shougo/neoinclude.vim') 
call dein#add('Shougo/context_filetype.vim') 
call dein#add('kana/vim-operator-user') 
call dein#add('Shougo/vimproc.vim', {'build': 'make'}) 
call dein#add('tomasr/molokai') 
"call dein#add('joshdick/onedark.vim') 
call dein#add('osyo-manga/vim-reunions' )
call dein#add('osyo-manga/vim-marching', {
            \ 'depends' : ['Shougo/vimproc.vim', 'osyo-manga/vim-reunions'],
            \ 'autoload' : {'filetypes' : ['c', 'cpp']}
            \ }) 
call dein#add('vim-jp/cpp-vim', {
            \ 'autoload' : {'filetypes' : 'cpp'}
            \ }) 
call dein#add('scrooloose/nerdtree')
"call dein#add('davidhalter/jedi-vim', {
"            \ 'autoload' : {'filetypes' : 'python'}
"            \ })

call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

set nu
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" $B9THV9f$N?'(B(colorscheme$B$N@_DjA0$K=q$/$3$H(B)
autocmd ColorScheme * highlight LineNr ctermfg=245

colorscheme molokai
syntax on
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
"let g:onedark_termcolors=16
set background=dark
set showmode
set title
set ruler
set showcmd
set showmatch
set scrolloff=5
set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
set nolist
"set listchars=tab:-,trail:
set laststatus=2
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace //
set autoread " update file automaticaly
set expandtab " insert space character insted tab
inoremap <silent> jj <ESC> " change from insert to command by typping jj"
set nosi                " disable smartindext
set tabstop=2 shiftwidth=2 softtabstop=2        "set indent space
set backspace=2
set wrapscan
set ignorecase
set smartcase
set noincsearch
set hlsearch
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ 'active': {
      \   'left': [['mode', 'paste'],
      \            ['fugitive', 'readonly', 'filename', 'modified']]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
  \ }
augroup cpp-namespace
  autocmd!
  autocmd FileType cpp inoremap <buffer><expr>; <SID>expand_namespace()
augroup END
augroup cpp-path
      autocmd!
      autocmd FileType cpp setlocal path=.,/usr/include,/usr/local/include,/usr/lib/c++/v1
augroup END
function! s:expand_namespace()
  let s = getline('.')[0:col('.')-1]
  if s =~# '\<b;$'
    return "\<BS>oost::"
  elseif s =~# '\<s;$'
    return "\<BS>td::"
  elseif s =~# '\<d;$'
    return "\<BS>etail::"
  elseif s =~# '\<p;$'
    return "\<BS>qxx::"
  else
    return ';'
  endif
endfunction

let g:neomru#time_format = "(%Y/%m/%d %H:%M:%S) "
noremap :um :Unite file_mru

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=97
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=68
let g:indent_guides_guide_size=1

filetype on
filetype plugin indent on

let g:neocomplete#force_overwrite_completefunc = 1
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case_completion = 1
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#min_syntax_length = 2
let g:neocomplete#enable_auto_select = 1
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:marching_enable_neocomplete = 1
"let g:clang_library_path = '/usr/lib/'
let g:marching#clang_command#options = {
      \ "cpp" : "-std=c++1y"
      \}
set updatetime=200

autocmd VimEnter * NERDTree
let g:NERDTreeShowBookmarks=1
autocmd vimenter * wincmd p
autocmd FileType cpp set keywordprg=cppman
command! -nargs=+ Cppman silent! call system("tmux split-window cppman " . expand(<q-args>))
      \}
autocmd FileType cpp nnoremap <silent><buffer> K <Esc>:Cppman <cword><CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"pep8 $B%A%'%C%+!<(B"
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
"pep8 $B<+F0Jd@5(B"
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')
endfunction

"$B<+F0$G(Bpep8$B$KD>$9(B
"autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>
autocmd FileType python nnoremap <F2> :call Autopep8()<CR>

"delete pop ups"
autocmd FileType python setlocal completeopt-=preview

"$B%S!<%W2;>C$9(B
set belloff=all

"vim$B$NGX7J?'(B
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

"ctag$B$r:F5"E*$K8!:w$5$;$k(B
set tags=tags;$HOME
nnoremap <C-w>} <C-w>]
nnoremap <C-w>] :vs <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
