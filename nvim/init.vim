call plug#begin()

" Greeter
Plug 'goolord/alpha-nvim'

" Session handling
Plug 'rmagatti/auto-session'

" Buffer deletion
Plug 'Asheq/close-buffers.vim'

" Airline
Plug 'vim-airline/vim-airline'

" Advanced File navigation
Plug 'nvim-tree/nvim-tree.lua'

" Simple File navigation
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

" Themes
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'

" Transparency
Plug 'tribela/transparent.nvim'

" Coments support for vim
Plug 'tpope/vim-commentary'

" REPL for languages
Plug 'jpalardy/vim-slime'

" Framework to better vim experiance
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" TSX and HTML tag autocompleteon
Plug 'AndrewRadev/tagalong.vim'

" Linter for JS and TS
Plug 'MunifTanjim/eslint.nvim'

" Highlight support
Plug 'nvim-treesitter/nvim-treesitter'

" Todo handling for vim
Plug 'folke/todo-comments.nvim'

" Some lua helpers for other plugins
Plug 'nvim-lua/plenary.nvim'

" Telsecope nvim
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }

" Telescope coc plugin
Plug 'fannheyward/telescope-coc.nvim'

" Search engine
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Telescope fzf integration
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()

"Lua plugins config
lua require('plugins.todo')
lua require('plugins.telescope')
lua require('plugins.nvim-tree')
lua require('plugins.auto-session')
lua require('plugins.alpha-nvim')
lua require('plugins.transparent')

" Smart Tab
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" Global status line
set laststatus=3

" Update time
set updatetime=500

" Terminal colors
set t_Co=256

" Theme
colorscheme gruvbox
set background=dark
set termguicolors
let g:airline_theme='gruvbox_material'
let g:gruvbox_material_better_performance = 1
syntax enable

" File type detection
filetype plugin indent on

" Text
set encoding=utf-8
set textwidth=80
set nobackup
set noswapfile
set fileencodings=utf8,cp1251
set wrap
set linebreak

" Backspace
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Update time
set updatetime=300

" Ruller
set ruler
set number relativenumber

" Turn off visualbell
set visualbell t_vb=
set novisualbell

" Clipboard
set clipboard+=unnamedplus

" Mouse
set mousehide
set mouse=a

" Leader
let mapleader = " "

" Create new tabs
nnoremap <leader>t :tabnew<Enter>

" Close all except current tab
nnoremap <leader>\ :tabonly<Enter>

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
let g:coc_global_extensions = ['coc-pairs', 'coc-eslint', 'coc-json', 'coc-highlight', 'coc-tsserver', 'coc-snippets', 'coc-cssmodules', 'coc-css', 'coc-html', 'coc-yaml', 'coc-prettier', 'coc-rust-analyzer', 'coc-omnisharp']

" Window menegment
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j

tnoremap <leader>h <C-\><C-N><C-w>h
tnoremap <leader>j <C-\><C-N><C-w>j
tnoremap <leader>k <C-\><C-N><C-w>k
tnoremap <leader>l <C-\><C-N><C-w>l

nnoremap <leader>x :vnew<CR>
nnoremap <leader>y :new<CR>

nnoremap <A-k> <C-w>+
nnoremap <A-j> <C-w>-
nnoremap <A-l> <C-w>>
nnoremap <A-h> <C-w><

" Close window
nnoremap <leader>d :close!<CR>

" Enter new line
nmap <Enter> :a<CR><CR>.<CR>

" Code navigation
nnoremap <S-k> 10k 
nnoremap <S-j> 10j 
nnoremap <S-l> 10l 
nnoremap <S-h> 10h 

vnoremap <S-k> 10k 
vnoremap <S-j> 10j 
vnoremap <S-l> 10l 
vnoremap <S-h> 10h 

nnoremap > $
nnoremap < 0

vnoremap > $
vnoremap < 0

" Remap Esc
:imap qq <Esc>
:imap QQ <Esc>
:xmap qq <Esc>
:xmap QQ <Esc>

" Airline Options
let g:Powerline_symbols='unicode'
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:airline#extensions#xkblayout#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#xkblayout#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0

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

" Code complition on Tab key 
inoremap <silent><expr> <Tab>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()

" Code complition next item
inoremap <silent><expr> <C-j>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()

" Code complition prev item
inoremap <silent><expr> <C-k> 
      \ coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"


inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"Buffer deleteng
nnoremap cb :silent! Bdelete menu<CR>

" Telescope
nnoremap ff <cmd>Telescope find_files<CR>
nnoremap fe <cmd>Telescope live_grep<CR>
nnoremap fb <cmd>Telescope buffers<CR>
nnoremap fp <cmd>Telescope jumplist<CR>
nnoremap fp <cmd>Telescope registers<CR>
nnoremap fh <cmd>Telescope help_tags<CR>

" Git
nnoremap fgs :silent! Telescope git_status<CR>
nnoremap fgc :silent! Telescope git_commits<CR>
nnoremap fgb :silent! Telescope git_branches<CR>

" Coc preview
nnoremap <leader>q :silent! call CocAction('doHover')<CR>

" Remap keys for applying codeAction to the current line
nmap <leader>a  <Plug>(coc-codeaction)

" Go to code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi :Telescope coc implementations <CR>
nmap <silent> gu :Telescope coc references <CR>
nmap <leader>q :silent! call CocAction('doHover')<CR>

nmap <silent> gp <C-o>
nmap <silent> gn <C-i>

" Nvim-tree setup
nnoremap <silent> <leader>f :NvimTreeFindFile<CR>

" Todo Manager setup
nnoremap ftd :TodoTelescope<Enter>

" Tagbar setup
nnoremap ftb :TagbarToggle<Enter>
let g:tagbar_map_togglefold = ''
let g:tagbar_map_jump = 'o'
let g:tagbar_map_showproto = ''
let g:tagbar_autoclose_netrw = 1
let g:tagbar_autofocus = 1

" Redo mapping
nnoremap U <C-r>

" Terminal handling
tnoremap qq <C-\><C-n>

" Session handling
nnoremap fs :SessionSearch<CR>

" Word deletion
inoremap <C-Backspace> <C-W>
