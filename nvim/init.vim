syntax on

" optionally set fat cursor 
set guicursor=a:blinkon150
set relativenumber
set nohlsearch 
set hidden
set noerrorbells
set tabstop=4 softtabstop=4 
set shiftwidth=4 
set expandtab
set autoindent
set smartindent
set nu
set foldmethod=syntax
set foldlevel=2
set nofoldenable
set foldnestmax=10
set ttimeoutlen=100 
set nowrap
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set notermguicolors
set smartindent
set autoindent

filetype plugin on
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType typescriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2


" colorscheme
highlight Cursor guifg=white guibg=black 
highlight iCursor guifg=white guibg=steelblue

" C-w closes tab so move to leader for pane switching
noremap ; <C-w>

tnoremap <Esc> <C-\><C-n>



" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
let g:loaded_matchparen=1

"plugins
runtime ./plug.vim
colorscheme gruvbox

" NERD comment
let g:NERDCreateDefaultMappings = 1
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let mapleader = ","

" close tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.ts'

:lua <<EOF
require("nvim-lsp-installer").setup({
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
EOF
