# Things to install
To make it work, we need to install some tools.

## The Window Manager
    sudo apt-get install i3wm

## The Background tool
    sudo apt-get install feh

## Monitor tool
    sudo apt-get install arandr

## Custom bar
    sudo apt-get install libxcb-xinerama0-dev
    sudo apt-get install libxcb-randr0-dev
    git clone https://github.com/LemonBoy/bar.git lemonbar
    cd lemonbar
    make
    sudo make install

## Install font awesome
    mkdir ~/.fonts
    wget https://github.com/FortAwesome/Font-Awesome/raw/master/fonts/fontawesome-webfont.ttf
    mv fontawesome-webfont.ttf ~/.fonts/

## File Explorer ?
    sudo apt-get install thunar
    sudo apt-get install gnome-icon-theme-full

## FireFox Theme
    https://github.com/horst3180/arc-firefox-theme

## GTK Appearance tool
    sudo apt-get install lxappearance

## GTK Theme
    wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_15.10/Release.key
    sudo apt-key add - < Release.key
    sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.10/ /' >>  /etc/apt/sources.list.d/arc-theme.list"
    sudo apt-get update
    sudo apt-get install arc-theme

## GTK Icons
    sudo add-apt-repository ppa:moka/stable
    sudo apt-get update && sudo apt-get install moka-icon-theme

## Better font rendering
    sudo add-apt-repository ppa:no1wantdthisname/ppa
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install fontconfig-infinality

## Install Yosemite SanFrancisco Font
    wget https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip
    unzip YosemiteSanFranciscoFont-master.zip
    mv YosemiteSanFranciscoFont-master/*.ttf ~/.fonts/
    rm -rd YosemiteSanFranciscoFont-master

Look on the link on the end of this file to know how to use it, cuz it's some kinda of manual task.


## Custom Lockscreen
    https://www.reddit.com/r/unixporn/comments/3358vu/i3lock_unixpornworthy_lock_screen
    https://git.fleshless.org/misc/tree/i3lock-extra

## To take printscreen, and pixelate it, needed to use custom lockscreen
    sudo apt-get install scrot imagemagick


## A tutorial can be found on
    https://www.youtube.com/watch?v=ARKIwOlazKI
