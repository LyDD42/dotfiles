set nocompatible              " be iMproved, required
filetype off                  " These two lines are required by vundle

set background=dark         " Assume a dark background
syntax on                   " Syntax highlighting
syntax enable
"set mouse=a                 " Automatically enable mouse usage
"set mousehide               " Hide the mouse cursor while typing
set showcmd                 " show typed command

" Format 
set ts=4
set shiftwidth=4
set softtabstop=4
set expandtab

set number
set relativenumber

" Search and Indent
set autoindent
set smartindent
set cindent
set autoread
set ignorecase
set smartcase
set hlsearch
noremap <F4>  :nohls <CR>

" No back up files 
" Do not understand...
set nobackup
set nowritebackup
set noswapfile

" Rule the define
set ruler
set cursorline

" Encoding setting
set encoding=utf-8
scriptencoding utf-8

" Buffer
nnoremap ]b :bn<cr>
nnoremap [b :bp<cr>
"nnoremap bd :bd<cr>  

" Tab
nnoremap ]t :tabnext<cr>
nnoremap [t :tabprev<cr>
nnoremap td :tabc<cr>

" Shortcut
" replace the word under cursor
:nmap <leader>s :%s/\(<c-r>=expand("<cword>")<cr>\)/
" replace the word under cursor as a word
:nmap <leader>sw :%s/\<\(<c-r>=expand("<cword>")<cr>\)\>/



" ========================= Vundle Plugin Setup Start  ========================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" @ Plugin --- [ Source Code Cheacker ]
"Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
" Plugin 'vim-syntastic/syntastic'

" @ Plugin --- [ Style Custom ]
Plugin 'morhetz/gruvbox'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'psliwka/vim-smoothie'

" @ Plugin --- [ Code Completion ]
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plugin 'LyDD42/vim-snippets'
Plugin 'honza/vim-snippets'

" @ Plugin --- [ Browse ]
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mileszs/ack.vim'

" @ Plugin --- [ Code Formatting ]
Plugin 'godlygeek/tabular'

call vundle#end()


filetype on
filetype plugin on
filetype plugin indent on


" Set Color Themes 
set background=dark
colorscheme gruvbox

" ========================= Vundle Plugin Setup End ========================
"
"
"
" ========================= Plugin Config Start ========================= 

" airline Config
let g:airline_theme = 'simple'


" YouCompleteMe Geek Config
set completeopt=longest,menu

let g:ycm_global_ycm_extra_conf                         = '$HOME/Code/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf                            = 0
let g:ycm_add_preview_to_completeopt					= 0

let g:ycm_min_num_of_chars_for_completion               = 2   " 
let g:ycm_collect_identifiers_from_tags_files           = 1   " enable identifiers collections from tags files
let g:ycm_collect_identifiers_from_comments_and_strings = 0   " disable identifier collections from comments and strings
let g:ycm_cache_omnifunc                                = 1
let g:ycm_seed_identifiers_with_syntax                  = 1   " sytax based completion
let g:ycm_complete_in_comments                          = 1   " enbale completion in comments 
let g:ycm_complete_in_strings                           = 1   " disable completion in strings

let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_blacklist = {
			\ 'notes'     : 1,
			\ 'markdown'  : 1,
			\ 'text'      : 1,
			\}
" YouCompleteMe Key Binding
let g:ycm_key_list_select_completion   = ['<Tab>', '<Down>']
" S-TAB stopped working, due to delimitMate
let g:ycm_key_list_previous_completion = ['<S-Tab>', '<Up>']

let g:ycm_show_diagnostics_ui                 = 1
let g:ycm_always_populate_location_list       = 1


" YCM shortcut
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>jg :YcmCompleter GoTo<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ji :YcmCompleter GoToInclude<CR>

nmap <leader>D <plug>(YCMHover)


" UltiSnips Config
let g:UltiSnipsExpandTrigger       = '<C-j>'
let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

set tags=./tags;


" NERDTree Config
let NERDTreeShowBookmarks               = 1
let NERDTreeIgnore                      = ['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode                   = 0
let NERDTreeQuitOnOpen                  = 0
let NERDTreeMouseMode                   = 2
let NERDTreeShowHidden                  = 1
let NERDTreeKeepTreeInNewTab            = 1
let g:nerdtree_tabs_open_on_gui_startup = 0

" NERDTree Shortcut
map <F9> :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>


" Tagbar Shortcut
nnoremap <leader>tt :TagbarToggle<CR>

" NERDTree Config
let g:ackprg = 'ag --vimgrep'


" Tabularize Shortcut
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" ========================= Plugin Config End =========================
