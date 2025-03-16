set nocompatible              " be iMproved, required
filetype off                  " These two lines are required by vundle

set background=dark         " Assume a dark background
syntax on                   " Syntax highlighting
syntax enable
set mouse= " disable mouse support
"set mousehide               " Hide the mouse cursor while typing
set showcmd                 " show typed command

" Format 
set ts=4
set shiftwidth=4
set softtabstop=4
set expandtab

set number
set relativenumber

" Indent
set autoindent
set smartindent
set cindent
set autoread

" Search
set ignorecase
set smartcase
set wildignorecase
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

" Change unnamed register
set clipboard+=unnamedplus

let g:python3_host_prog = "$HOME/.local/bin/python"

" ========================= Vundle Plugin Setup Start  ========================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

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
Plugin 'windwp/nvim-autopairs'

" @ Plugin --- [ Browse ]
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" @ Plugin --- [ Code Formatting ]
" Plugin 'godlygeek/tabular'

" @ Plugin --- [ LSP ]
Plugin 'git@github.com:neovim/nvim-lspconfig.git'

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

let g:ycm_global_ycm_extra_conf                         = '$HOME/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf                            = 0
let g:ycm_add_preview_to_completeopt			        = 0
let g:ycm_auto_trigger                                  = 1
let g:ycm_enable_semantic_highlighting                  = 0

let g:ycm_min_num_of_chars_for_completion               = 2
let g:ycm_collect_identifiers_from_tags_files           = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_cache_omnifunc                                = 1
let g:ycm_seed_identifiers_with_syntax                  = 1
let g:ycm_complete_in_comments                          = 1
let g:ycm_complete_in_strings                           = 1

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


" FZF Shortcut
nnoremap <silent> <leader><leader> :GFiles<CR>
nnoremap <silent> <leader><bar> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)


function! RipgrepFzf(query, fullscreen)
    let command = "rg --column --line-number --no-heading --color=always --smart-case "
    call fzf#vim#grep(command . a:query, 1, fzf#vim#with_preview(), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)


" " Tabularize Shortcut
" nmap <Leader>a& :Tabularize /&<CR>
" vmap <Leader>a& :Tabularize /&<CR>
" nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
" vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
" nmap <Leader>a=> :Tabularize /=><CR>
" vmap <Leader>a=> :Tabularize /=><CR>
" nmap <Leader>a: :Tabularize /:<CR>
" vmap <Leader>a: :Tabularize /:<CR>
" nmap <Leader>a:: :Tabularize /:\zs<CR>
" vmap <Leader>a:: :Tabularize /:\zs<CR>
" nmap <Leader>a, :Tabularize /,<CR>
" vmap <Leader>a, :Tabularize /,<CR>
" nmap <Leader>a,, :Tabularize /,\zs<CR>
" vmap <Leader>a,, :Tabularize /,\zs<CR>
" nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" nvim-autopairs
lua << EOF
require("nvim-autopairs").setup {}
EOF

" ========================= Plugin Config End =========================

" ========================= LSP Config Start =========================
lua << EOF
vim.lsp.set_log_level("ERROR")
EOF

lua << EOF
vim.diagnostic.config({
    underline = false,
    update_in_insert = false,
})
EOF

" disabled as not used frequently
" nnoremap <leader>li :LspInfo<CR>
" nnoremap <leader>ls :LspStop<CR>
" nnoremap <leader>ll :LspStart<CR>

set omnifunc=v:lua.vim.lsp.omnifunc
" TODO: figure out how this interacts with selection in completion menu. :help popupmenu-completion
" inoremap <silent> <C-N> <C-X><C-O>

nnoremap K :lua vim.lsp.buf.hover()<CR>

nnoremap <leader>gg :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gd :lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gu :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rr :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>f :lua vim.lsp.buf.format()<CR>
vnoremap <leader>f :lua vim.lsp.buf.format()<CR>
vnoremap <leader>cc :lua vim.lsp.buf.code_action()<CR>

nnoremap <leader>el :lua vim.diagnostic.setloclist({ severity = { min=vim.diagnostic.severity.WARN } })<CR>
nnoremap <leader>eL :lua vim.diagnostic.setloclist({ severity = { min=vim.diagnostic.severity.HINT } })<CR>

lua << EOF
require('lspconfig').pyright.setup {
  settings = {
    pyright = {
        -- Using Ruff's import organizer
        disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
}
EOF

lua << EOF
require('lspconfig').ruff.setup {
  init_options = {
    settings = {
      configurationPreference = "editorOnly"
    },
  },
}
EOF

augroup aupython
    au!
    au FileType python setlocal colorcolumn=120
    au FileType python setlocal textwidth=120

    " this is handled by ruff lsp now
    " au FileType python nnoremap <buffer> <leader>f my:0,$!ruff format -q -<CR>'y
    " au FileType python inoremap <buffer> <leader>f :'<,'>!ruff format -q -<CR>

    au FileType python setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup END

" ========================= LSP Config End =========================
