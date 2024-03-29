cur_dir=$(dirname "$0")
echo 1. install basic packages by apt install
sudo apt update;
sudo apt upgrade -y;
sudo apt autoremove -y;

sudo apt install ctags -y;
sudo apt install vim -y;
sudo apt install vim-gnome -y;
sudo apt install highlight -y;
sudo apt install git -y;
sudo apt install cmake -y;
sudo apt install zsh -y;
sudo apt install python3 -y;
sudo apt install python3-dev -y;
sudo apt install python3-pip -y;
sudo apt install tmux -y;
sudo apt install net-tools -y;
sudo apt install ssh openssl  -y;

pip3 install pip --upgrade
pip3 install setuptools

echo 2. setup zsh
echo remember to enter 'exit' after finish install oh my zsh [Press Enter]
read
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting --depth 1
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions --depth 1
cp $cur_dir/rcs/zshrc $HOME/.zshrc

echo 3. setup fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf --depth 1
~/.fzf/install

echo 4. setup vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim --depth 1
pip3 install pylint
cp $cur_dir/rcs/vimrc $HOME/.vimrc
vim << EOF
:PluginInstall
EOF

cd ~/.vim/bundle/YouCompleteMe/
python3 install.py
cd -

echo 5. setup tmux
cd
git clone https://github.com/indestinee/.tmux.git --depth 1
ln -s -f .tmux/.tmux.conf
ln -s .tmux/.tmux.conf.local .
cd -

zsh
