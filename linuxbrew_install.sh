git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
mkdir ~/.linuxbrew/bin
ln -s ../Homebrew/bin/brew ~/.linuxbrew/bin
eval $(~/.linuxbrew/bin/brew shellenv)

echo -e 'export PATH=${HOME}/.linuxbrew/bin:$PATH'     >> ~/.bashrc
source ~/.bashrc
