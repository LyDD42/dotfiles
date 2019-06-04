set nocompatible              " be iMproved, required
filetype off                  " These two lines are required by vundle

set background=dark         " Assume a dark background
syntax on                   " Syntax highlighting
syntax enable
"set mouse=a                 " Automatically enable mouse usage
"set mousehide               " Hide the mouse cursor while typing

" Format 
set ts=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number

" Search and Indent
set autoindent
set smartindent
set cindent
set autoread
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
map bj :bn<cr>
map bk :bp<cr>
map bd :bd<cr>  

" Tab
nnoremap tj :tabnext<cr>
nnoremap tk :tabprev<cr>
nnoremap td :tabc<cr>

" Shortcut
" replace the word under cursor
:nmap <leader>s :%s/\(<c-r>=expand("<cword>")<cr>\)/
" replace the word under cursor as a word
:nmap <leader>sw :%s/\<\(<c-r>=expand("<cword>")<cr>\)\>/

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" @ Plugin --- [ Source Code Cheacker ]
"Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/syntastic'

" @ Plugin --- [ Style Custom ]
Plugin 'morhetz/gruvbox'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'terryma/vim-smooth-scroll'

" @ Plugin --- [ Code Completion ]
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'LyDD42/vim-snippets'

" @ Plugin --- [ Browse ]
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
" Plugin 'Raimondi/delimitMate'
Plugin 'jiangmiao/auto-pairs'

" @ Plugin --- [ Code Formatting ]
Plugin 'godlygeek/tabular'

call vundle#end()


filetype on
filetype plugin on
filetype plugin indent on


" Set Color Themes 
set background=dark
colorscheme gruvbox

" @ COLOR Themes
"colorsche jellybeans
"colorscheme hybrid
"colorscheme solarized
"colorscheme gruvbox
"colorscheme darktango
"colorscheme hybrid-light
"colorscheme badwolf
"colorscheme mirodark	
"colorscheme codeschool

" ========================= Vundle Plugin Setup End ========================
"
"
"
" ========================= Plugin Config Start ========================= 

" @ If you used [airline]  You should Ignor this! 

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

" -----------------------------

" " alrLine && PowerLine Config
" let g:Powerline_symbols = 'fancy'
" let g:airline_powerline_fonts = 1
" "let Powerline_symbols = 'compatible
" 
" vim-airline {
" Set configuration options for the statusline plugin vim-airline.
" Use the powerline theme and optionally enable powerline symbols.
" To use the symbols , , , , , , and .in the statusline
" segments add the following to your .vimrc.before.local file:
"   let g:airline_powerline_fonts=1
" If the previous symbols do not render for you then install a
" powerline enabled font.

" See `:echo g:airline_theme_map` for some more choices
" Default in terminal vim is 'dark'
if isdirectory(expand("~/.vim/bundle/vim-airline/"))
	if !exists('g:airline_theme')
		let g:airline_theme = 'simple'
	endif
	if !exists('g:airline_powerline_fonts')
		" Use the default set of separators with a few customizations
		let g:airline_left_sep='›'  " Slightly fancier than '>'
		let g:airline_right_sep='‹' " Slightly fancier than '<'
		let g:airline#extensions#tabline#enabled = 1 "tabbar
		set laststatus=2
	endif
endif
" enable syntastic integration in airline
let g:airline#extensions#syntastic#enabled = 1
" }


" vim-smooth-scroll Config
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list      = 1
let g:syntastic_auto_loc_list                 = 1
let g:syntastic_check_on_open                 = 1
let g:syntastic_check_on_wq                   = 1
" enbale header file check for c++
let g:syntastic_cpp_check_header              = 1
" disable ycm diagnosis while syntastic is on, to enable synstastic checker
let g:ycm_show_diagnostics_ui                 = 0

" set Syntastic Cheacker engine 
" example JavaScript use JSHint [ NodeJS ]
"let g:syntastic_php_checkers        = ['php', 'phpcs', 'phpmd']
"let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_java_checkers       = ['java', 'jsp']
"let g:syntastic_c_checkers          = ['gcc']
let g:syntastic_cpp_checkers         = ['gcc']
let g:syntastic_cpp_compiler_options = ' '


" YouCompleteMe Geek Config
set completeopt=longest,menu

let g:ycm_global_ycm_extra_conf                         = '$HOME/Code/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf                            = 0
let g:ycm_add_preview_to_completeopt					= 0

let g:ycm_min_num_of_chars_for_completion               = 2   " 
let g:ycm_collect_identifiers_from_tags_files           = 1   " enable identifiers collections from tags files
let g:ycm_collect_identifiers_from_comments_and_strings = 0   " disable identifier collections from comments and strings
let g:ycm_cache_omnifunc                                = 1
let g:ycm_seed_identifiers_with_syntax                  = 1   " 语法关键字补全
let g:ycm_complete_in_comments                          = 1   " enbale completion in comments 
let g:ycm_complete_in_strings                           = 0   " disable completion in strings

let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_blacklist = {
			\ 'notes'     : 1,
			\ 'markdown'  : 1,
			\ 'text'      : 1,
			\}
" YouCompleteMe Key Binding
let g:ycm_key_list_select_completion   = ['<Tab>', '<Down>']
" S-TAB suddenly stopped working, due to delimitMate
let g:ycm_key_list_previous_completion = ['<S-Tab>', '<Up>']


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
nmap <leader>nt :NERDTreeFind<CR>

" Tagbar Shortcut
nnoremap <leader>tt :TagbarToggle<CR>

" " delimitMate Config
" " removed, not compativle with ycm
" " delimitMate is disabling S-Tab in ycm
" let g:delimitMate_expand_cr    = 1
" let g:delimitMate_expand_space = 1

" Synstastic Shortcut
noremap <F6>  :SyntasticToggleMode <CR>

" YCM shortcut
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>		"Go to definition
nnoremap <leader>ji :YcmCompleter GoToInclude<CR>						"Go to include file

" C++ Syntax HighLight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1


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
