sudo apt update
sudo apt install zsh python3-pip ctags cmake curl fd-find silversearcher-ag
sudo pip3 install flake8
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp ./zshrc ~/.zshrc
cp ./vimrc ~/.vimrc
