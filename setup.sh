#!/bin/sh
cd ~

## install Anaconda 3
# if your OS is Linux
wget https://repo.anaconda.com/archive/Anaconda3-2018.12-Linux-x86_64.sh
sh Anaconda3-2018.12-Linux-x86_64.sh
# add Anaconda to PATH
echo -e # added by Anaconda3 installer\\nif [ -d "${HOME}/anaconda3" ] ; then\\n\\texport PATH="${HOME}/anaconda3/bin:$PATH"\\nfi >> .bashrc
