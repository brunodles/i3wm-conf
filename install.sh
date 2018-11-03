#! /bin/bash
echo
echo "We will install the fonts into system, so the root permission/password is required during installing"
echo
./installScripts/basic
./installScripts/i3
./installScripts/fonts
./installScripts/zsh
./installScripts/userUtils
