sudo apt-get update
sudo apt-get install zsh git wget curl htop tmux whois tree pv mc vim

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.vim/colors/darcula.vim --create-dirs https://raw.githubusercontent.com/blueshirts/darcula/master/colors/darcula.vim
curl -fLo ~/.vimrc https://raw.githubusercontent.com/s-chizhik/dotfiles/master/.vimrc

curl -fLo ~/.gitconfig https://raw.githubusercontent.com/s-chizhik/dotfiles/master/.gitconfig
