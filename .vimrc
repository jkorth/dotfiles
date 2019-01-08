if empty(glob('/Users/jake/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'haishanh/night-owl.vim'
Plug 'w0rp/ale'
Plug 'elixir-editors/vim-elixir'
Plug 'leafgarland/typescript-vim'
Plug 'lumiliet/vim-twig'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'StanAngeloff/php.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'plasticboy/vim-markdown'
call plug#end()

" Theme setup
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme night-owl

if &term=~ '256color'
 set t_ut=
endif

" ALE Linters
let g:ale_linters = {}
let g:ale_linters.typescript = ['tslint', 'tsserver']

" ALE Fixers
let g:ale_fixers = {}
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.elixir = ['mix_format']
let g:ale_fixers.typescript = ['prettier', 'tslint']
let g:ale_fixers.javascript = ['prettier']
let g:ale_fixers.css = ['prettier']
let g:ale_fixers.html = ['prettier']
let g:ale_elixir_elixir_ls_release = '/Users/jake/repositories/language_servers/elixir-ls/rel'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

" Airline setup
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'night_owl'

" Get the delete button working
set backspace=indent,eol,start

" Show line numbers
set number

" Set tab width to 2
set tabstop=2
set shiftwidth=2
set smartindent

" Use system clipboard
set clipboard=unnamed

" Move between buffers
map <C-Left> <Esc>:bprev<CR>
map <C-Right> <Esc>:bnext<CR>

" Switch between splits
map <C-h> <C-W>h
map <C-l> <C-W>l

" Prevent deselection after shift
vnoremap > >gv
vnoremap < <gv

" Setup keybinding for toggling nerdtree
map <C-b> :NERDTreeToggle<CR>

" Setup alternative keybinding for getting back to normal mode
inoremap fd <ESC>
