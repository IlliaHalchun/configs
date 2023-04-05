set nocompatible

filetype off
call plug#begin()

" Omnisharp for C#
Plug 'OmniSharp/omnisharp-vim'

" Tagbar for c c++
Plug 'preservim/tagbar'

Plug 'tribela/vim-transparent'
Plug 'tomasr/molokai'
Plug 'fenetikm/falcon'
Plug 'morhetz/gruvbox'
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'jpalardy/vim-slime'
Plug 'lanox/lanox-vim-theme'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'MunifTanjim/eslint.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'rest-nvim/rest.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'folke/todo-comments.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

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
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git -o -name obj -o -name bin \) -prune -o -print'

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 1

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

" Coc Nvim
" Tab Selection of autocomplete
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Coc extensions
let g:coc_global_extensions = ['coc-omnisharp', 'coc-clangd', 'coc-pairs', 'coc-eslint', 'coc-json', 'coc-highlight', 'coc-tsserver', 'coc-snippets', 'coc-html-css-support', 'coc-cssmodules', 'coc-css', 'coc-html', 'coc-lua', 'coc-yaml', 'coc-restclient']

" Window menegment
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j
nnoremap <leader>d :exit<CR>

inoremap <silent><expr> <tab> coc#refresh()

" Remaping EndLine and StartLine
nnoremap <leader>\ $
nnoremap <leader>' ^

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

" UltiSnips Complition Trigger
let g:UltiSnipsComplitionTrigger="<CR>"

" Emmet for vim
let g:user_emmet_leader_key='<C-E>'

" Remap Endline StartLine
nnoremap > $
nnoremap < 0

" Ranger
let g:ranger_map_keys = 0
nnoremap ff :Ranger<CR>

" Coc preview
nnoremap <leader><leader> :<C-U>call CocAction('doHover')<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Coc settings
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Emmet complete
let g:user_emmet_leader_key = '<C-E>'

" Nvim-tree setup
nnoremap <silent> <leader>f :NvimTreeFocus<cr>

" Rest_cli setup
nnoremap rc <Plug>RestNvim
nnoremap rp <Plug>RestNvimLast

" Todo Manager setup
nnoremap td :TodoTelescope<Enter>

" Tagbar setup
nnoremap tb :TagbarToggle<Enter>
let g:tagbar_map_togglefold = ''
let g:tagbar_map_jump = 'o'
let g:tagbar_map_showproto = ''
let g:tagbar_autoclose_netrw = 1
let g:tagbar_autofocus = 1

" Lua plugins config
lua require('illiahalchun.nvim-tree')
lua require('illiahalchun.eslint')
lua require('illiahalchun.rest_api_cli')
lua require('illiahalchun.todo')
lua require('illiahalchun.telescope')

