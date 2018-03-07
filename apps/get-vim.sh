sudo apt-get install build-essential -y

sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev git  -y


sudo apt-get remove vim vim-runtime gvim -y
sudo apt-get remove vim-tiny vim-common vim-gui-common -y


cd ~
git clone https://github.com/vim/vim.git

cd ~vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-pythoninterp=yes \
            --enable-python3interp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim80

sudo make install

sudo apt install checkinstall
cd ~/vim
sudo checkinstall


sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
