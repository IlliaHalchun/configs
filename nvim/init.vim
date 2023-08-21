filetype off
call plug#begin()

" File navigation
Plug 'tamago324/lir.nvim'
Plug 'tamago324/lir-git-status.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Git support
Plug 'tpope/vim-fugitive'

" Cursor
Plug 'yamatsum/nvim-cursorline'

" Tagbar
Plug 'preservim/tagbar'
 
" Python language server
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }

" Transparent vim
Plug 'tribela/vim-transparent'

" Coments support for vim
Plug 'tpope/vim-commentary'

" Airline layout
Plug 'vim-airline/vim-airline'

" REPL for languages
Plug 'jpalardy/vim-slime'

" Framework to better vim experiance
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" TSX and HTML tag autocompleteon
Plug 'AndrewRadev/tagalong.vim'

" Themes
Plug 'sainnhe/gruvbox-material'
Plug 'tomasr/molokai'
Plug 'fenetikm/falcon'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'lanox/lanox-vim-theme'
Plug 'vim-airline/vim-airline-themes'

" Linter for JS and TS
Plug 'MunifTanjim/eslint.nvim'

" Highlight support
Plug 'nvim-treesitter/nvim-treesitter'

" Todo handling for vim
Plug 'folke/todo-comments.nvim'

" Telsecope nvim
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

" Telescope coc plugin to show results of coc in telegraf
Plug 'fannheyward/telescope-coc.nvim'

call plug#end()

" Smart Tab
set smartindent
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Update time
set updatetime=500
colorscheme gruvbox
set background=dark
set termguicolors
let g:airline_theme='falcon'

syntax enable
filetype plugin indent on
set encoding=UTF-8
set textwidth=80

let g:slime_target = "kitty"

set backspace=indent,eol,start whichwrap+=<,>,[,]

set wrap
set linebreak

set nobackup
set noswapfile
set encoding=utf-8
set fileencodings=utf8,cp1251

set clipboard=unnamed
set ruler

"Turn off visualbell
set visualbell t_vb=

nnoremap<leader><Right> tabn<cr>

set nu
set number relativenumber
set mousehide
set mouse=a
set termencoding=utf-8
set novisualbell
set autoindent

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4

set t_Co=256

let mapleader = " "

" create new tabs
nnoremap <leader>t :tabnew<Enter>
" Close all except current tab
nnoremap <leader>\ :tabonly<Enter>
nnoremap <F1> :buffers<CR>:buffer<Space>
" Navigating tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
" Previous and next window
nnoremap <leader>] gt
nnoremap <leader>[ gT

" Coc extensions
let g:coc_global_extensions = ['coc-pairs', 'coc-eslint', 'coc-json', 'coc-highlight', 'coc-tsserver', 'coc-snippets', 'coc-html-css-support', 'coc-cssmodules', 'coc-css', 'coc-html', 'coc-yaml', 'coc-prettier']

" Window menegment
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j

" Close tab and delete buffer
nnoremap <leader>d :bd<CR>

inoremap <silent><expr> <tab> coc#refresh()

" Saves
noremap <silent> <D-S>          :w<CR>
vnoremap <silent> <D-S>         <C-C>:w<CR>
inoremap <silent> <D-S>         <C-O>:w<CR>

nmap <CR> :a<CR><CR>.<CR>

" Remap Esc
:imap qq <Esc>
:imap QQ <Esc>

" Airline Options
let g:Powerline_symbols='unicode'
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:airline#extensions#xkblayout#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#xkblayout#enabled = 0

" JS/TS Syntaxis
let g:typescript_indent_disable = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" Coc complition settings
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()

inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Remap Endline StartLine
nnoremap > $
nnoremap < 0

"Buffer deleteng
command! BufCurOnly execute '%bdelete|edit#|bdelete#'
nnoremap <leader>cb :BufCurOnly<CR>

" Telescope
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>

" Coc preview
nnoremap <leader><leader> :<C-U>call CocAction('doHover')<CR>

" Neo-tree setup
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi :Telescope coc implementations <CR>
nmap <silent> gr :Telescope coc references <CR>

" Neo-tree setup
nnoremap <silent> <leader>f :lua require'lir.float'.toggle()<CR>

" Todo Manager setup
nnoremap td :TodoTelescope<Enter>

" Tagbar setup
nnoremap tb :TagbarToggle<Enter>
let g:tagbar_map_togglefold = ''
let g:tagbar_map_jump = 'o'
let g:tagbar_map_showproto = ''
let g:tagbar_autoclose_netrw = 1
let g:tagbar_autofocus = 1

"Lua plugins config
lua require('illiahalchun.todo')
lua require('illiahalchun.telescope')
lua require('illiahalchun.lir-nvim')
