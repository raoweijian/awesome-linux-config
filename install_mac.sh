set -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install fd jq libpq the_silver_searcher rbenv ruby-build

# nvm
rm -rf $HOME/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install 16.20.0
corepack enable

# 配置 neovim
rm -rf $HOME/.config/nvim
rm -rf $HOME/.config/coc
mkdir -p $HOME/.config/nvim
curl https://raw.githubusercontent.com/raoweijian/awesome-linux-config/master/init.lua --output $HOME/.config/nvim/init.lua
# curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim --headless +qall

cd $HOME/.local/share/nvim/lazy/coc.nvim
yarn install

# coc
mkdir -p $HOME/.config/coc/extensions
cd $HOME/.config/coc/extensions
yarn add coc-eslint coc-json coc-flow
cd -
curl -fLo $HOME/.config/nvim/coc-settings.json https://raw.githubusercontent.com/raoweijian/awesome-linux-config/master/coc-settings.json


# rbenv
rm -rf $HOME/.rbenv
eval "$(rbenv init - zsh)"
rbenv install 2.7.7

# 配置 zsh
rm -rf $HOME/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# cp zshrc_mac $HOME/.zshrc
curl https://raw.githubusercontent.com/raoweijian/awesome-linux-config/master/zshrc_mac --output $HOME/.zshrc

curl -fLo $HOME/.fdignore https://raw.githubusercontent.com/raoweijian/awesome-linux-config/master/fdignore
