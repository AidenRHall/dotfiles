if [ ! -d $HOME/.dotfiles ]; then
    echo "exiting: $HOME/.dotfiles does not exist"
    exit 1
fi

if [ $PWD != $HOME/.dotfiles ]; then
    echo "exiting: $HOME/.dotfiles is not the pwd"
    exit 1
fi

declare -a FILES=('.vimrc'
                  '.vim'
                  '.zshrc'
                  '.ackrc'
                  '.oh-my-zsh'
                  '.zsh_custom'
                  '.aliases'
                  '.powerline'
                  '.tmux.conf')

mkdir $HOME/.dotfiles/.zsh_custom/plugins
mkdir $HOME/.dotfiles/.vim/backups
mkdir $HOME/.dotfiles/.vim/undodir
mkdir $HOME/.dotfiles/.vim/bundle

git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting .zsh_custom/plugins/zsh-syntax-highlighting
git clone https://github.com/powerline/powerline.git .powerline

git clone https://github.com/gmarik/Vundle.vim .vim/bundle/Vundle.vim
vim +BundleInstall +qall

git clone https://github.com/powerline/fonts.git
bash fonts/install.sh
rm -rf fonts

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


echo "done setting up"
