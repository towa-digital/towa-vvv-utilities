#!/usr/bin/env bash

echo "Setting up your Dotfiles..."

if [[ ! -d "/home/vagrant/.zshrc" ]]; then
	sh -c "echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/antigen/xUbuntu_14.04/ /' > /etc/apt/sources.list.d/antigen.list"
	apt-get update

	# install packages
	apt-get -y install antigen
	apt-get -y install zsh

	# Make ZSH the default shell environment
	chsh -s which zsh

	wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | apt-key add -
	echo "deb http://apt.thoughtbot.com/debian/ stable main" | tee /etc/apt/sources.list.d/thoughtbot.list
	apt-get update
	apt-get -y install rcm

	# TODO: public repo?
	git clone git@bitbucket.org:dseidl/dotfiles.git /home/vagrant/.dotfiles

	cd /home/vagrant/.dotfiles
	rcup
fi
