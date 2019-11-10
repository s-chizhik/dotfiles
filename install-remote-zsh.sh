#!/bin/sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl https://raw.githubusercontent.com/s-chizhik/dotfiles/master/.zshrc > ~/.zshrc
