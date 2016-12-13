#! /bin/bash

# Install I3wm and I3blocks
sudo apt-get install i3
sudo apt-get install i3blocks

# Clone My i3wm config 
mkdir .config/i3
cd .config/i3/
git clone https://github.com/brunodles/i3wm-conf.git .

# Install FontAwesome
wget https://github.com/FortAwesome/Font-Awesome/raw/master/fonts/fontawesome-webfont.ttf
mv fontawesome-webfont.ttf ~/.fonts/

# To change the background
sudo apt-get install feh
# File explorer
sudo apt-get install thunar
# Custom theme
sudo apt-get install gnome-icon-theme-full
sudo apt-get install lxappearance
# Lockscreen
sudo apt-get install scrot

# Install zsh
sudo apt-get install zsh
chsh -s $(which zsh)

# Install custom fonts
mkdir ~/customization
cd ~/customization/
git clone https://github.com/powerline/fonts.git
cd fonts/
./install.sh 

# Install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install My custom zsh-theme
mkdir ~/.oh-my-zsh/custom/themes
curl -o ~/.oh-my-zsh/custom/themes/lima-agnoster.zsh-theme https://gist.githubusercontent.com/brunodles/9bb7c3ff4e2a7b9e9bddece9082c35ca/raw/lima-agnoster.zsh-theme
