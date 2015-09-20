if [ ! -d $HOME/.dotfiles ]; then
    echo "exiting: $HOME/.dotfiles does not exist"
    exit 1
fi

declare -a FILES=('.vimrc'
                  '.vim'
                  '.zshrc'
                  '.ackrc'
                  '.oh-my-zsh'
                  '.zsh_custom'
                  '.aliases'
                  '.tmux.conf')

git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh
sudo pip install powerline-status
for FILE in "${FILES[@]}"
do
    if [ -f $HOME/.dotfiles/$FILE -o -d $HOME/.dotfiles/$FILE ]; then
        if [ -f $HOME/$FILE -o -d $HOME/$FILE ]; then
            rm -r $HOME/$FILE
        fi
        ln -s $HOME/.dotfiles/$FILE $HOME/$FILE
        echo "$FILE: symlinked"
    else
        echo "$FILE: does not exist"
    fi
done

mkdir $HOME/.vim/backups
mkdir $HOME/.vim/undodir

mkdir $HOME/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim .vim/bundle/Vundle.vim
vim +BundleInstall +qall

git clone https://github.com/powerline/fonts.git
bash fonts/install.sh
rm -rf fonts

echo 'done setting up'
