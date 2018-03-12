" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" curl -fLo ~/.vim/colors/darcula.vim --create-dirs https://raw.githubusercontent.com/blueshirts/darcula/master/colors/darcula.vim
" curl -fLo ~/.vimrc https://raw.githubusercontent.com/s-chizhik/dotfiles/master/.vimrc

set number       " номер строки
set hlsearch     " подсвечивать найденные совпадения
set incsearch    " incremental search

syntax enable
colorscheme darcula

set backspace=indent,eol,start


call plug#begin('~/.vim/plugged')
	Plug 'joonty/vdebug', {'branch': 'v2-integration'}
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
	Plug 'jiangmiao/auto-pairs'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'jistr/vim-nerdtree-tabs'

	let NERDTreeMapOpenInTab='<ENTER>'    " плюшечка которая открывает файлы из NerdTree в новых табах
	Plug 'Nopik/vim-nerdtree-direnter'    " Плюшечка которая чинит предыдущую плюшечку, которая пытается вместо файлов в новой вкладке открывать папки

call plug#end()


map <C-n> :NERDTreeToggle<CR>


let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
map <C-t> :tabnew<CR>


let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
