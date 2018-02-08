" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" curl -fLo ~/.vim/colors/darcula.vim --create-dirs https://raw.githubusercontent.com/blueshirts/darcula/master/colors/darcula.vim
" curl -fLo ~/.vimrc https://raw.githubusercontent.com/s-chizhik/dotfiles/master/.vimrc

set number     " номер строки
set hlsearch   " подсвечивать найденные совпадения
set incsearch  " incremental search

syntax enable
colorscheme darcula

set backspace=indent,eol,start


call plug#begin('~/.vim/plugged')

Plug 'joonty/vdebug', {'branch': 'v2-integration'} " or master for python2
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'

call plug#end()

map <C-n> :NERDTreeToggle<CR>
map <C-t> :tabnew<CR>
"map <C-]> :tabnext<CR>
"map <C-[> :tabprevious<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"let g:vdebug_keymap['run'] = '<C-s>'

