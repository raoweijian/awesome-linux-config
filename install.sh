sudo apt update
sudo apt install -y zsh python3-pip ctags cmake curl fd-find silversearcher-ag neovim rbenv

# 配置 neovim
mkdir -p $HOME/.config/nvim
curl https://raw.githubusercontent.com/raoweijian/awesome-linux-config/master/init.vim --output $HOME/.config/nvim/init.vim
nvim +PluginInstall +qall

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# rbenv
rbenv init
# curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash

# 配置 zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
curl https://raw.githubusercontent.com/raoweijian/awesome-linux-config/master/zshrc --output $HOME/.zshrc
