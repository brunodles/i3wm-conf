#! /bin/bash

# Install I3wm and I3blocks
sudo apt-get install i3
sudo apt-get install i3blocks

# Clone My i3wm config 
mkdir .config/i3
cd .config/i3/
git clone https://github.com/brunodles/i3wm-conf.git .

# Install FontAwesome
mkdir ~/.fonts
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
curl -o ~/.oh-my-zsh/custom/themes/agnoster-lima.zsh-theme https://gist.githubusercontent.com/brunodles/9bb7c3ff4e2a7b9e9bddece9082c35ca/raw/lima-agnoster.zsh-theme

# Install My .zshrc file
curl -o ~/.zshrc https://gist.githubusercontent.com/brunodles/c0d5fa8dfddeb6af24dde4f1f00854a3/raw

# Instal custom color theme
wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_15.10/Release.key
sudo apt-key add - < Release.key
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.10/ /' >>  /etc/apt/sources.list.d/arc-theme.list"
sudo add-apt-repository -y ppa:moka/stable
sudo apt-get update
sudo apt-get install -y arc-theme
sudo apt-get install -y moka-icon-theme
