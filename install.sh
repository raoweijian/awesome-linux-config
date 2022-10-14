set -e

sudo apt update
sudo apt install -y zsh python3-pip cmake curl fd-find silversearcher-ag neovim gnupg2

# nvm
rm -rf $HOME/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install 16
corepack enable

# 配置 neovim
rm -rf $HOME/.config/nvim
rm -rf $HOME/.config/coc
mkdir -p $HOME/.config/nvim
curl https://raw.githubusercontent.com/raoweijian/awesome-linux-config/master/init.vim --output $HOME/.config/nvim/init.vim
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim --headless +PlugInstall +qall

# coc
mkdir -p $HOME/.config/coc/extensions
cd $HOME/.config/coc/extensions
yarn add coc-eslint coc-json coc-flow
cd -
curl -fLo $HOME/.config/nvim/coc-settings.json https://raw.githubusercontent.com/raoweijian/awesome-linux-config/master/coc-settings.json

# rvm
rm -rf $HOME/.rvm
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable --auto-dotfiles

# 配置 zsh
rm -rf $HOME/.oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
curl https://raw.githubusercontent.com/raoweijian/awesome-linux-config/master/zshrc --output $HOME/.zshrc

curl -fLo $HOME/.fdignore https://raw.githubusercontent.com/raoweijian/awesome-linux-config/master/fdignore
