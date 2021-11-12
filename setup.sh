#!/bin/bash

# This script is written to simplify the setup of terminal environments where I do my development work. I have no guarantee that it will work effectively for all use cases, though I will do my best to document it step by step for anyone to follow along. It's written in bash but the end product is a zsh environment.

function check_installed() {
	if [[ $(which $1) ]]; then
		echo "$1 already installed!"
	else
		echo "$1 not installed, install and then continue"
		exit 1
	fi
}

check_installed zsh
check_installed vim
check_installed tmux

echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Adding aliases to .zshrc"
echo "alias b='cd ..'" >> ~/.zshrc

echo "Configuring tmux"
cat tmux_config.conf > ~/.tmux.conf

echo "configuring vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cat vim_config.conf > ~/.vimrc 
vim +PluginInstall +qall

echo "Theming Oh My Zsh"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i '' -e 's#ZSH_THEME="robbyrussell"$#ZSH_THEME="powerlevel10k/powerlevel10k"#g' ~/.zshrc

echo "Restart terminal to finish configuration"

