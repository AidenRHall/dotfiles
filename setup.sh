if [ ! -d /home/`whoami`/.dotfiles ]; then
    echo "exiting: /home/`whoami`/.dotfiles does not exist"
    exit 1
fi

declare -a FILES=('.vimrc'
                  '.vim'
                  '.zshrc'
                  '.oh-my-zsh'
                  '.aliases')

for FILE in "${FILES[@]}"
do
    if [ -f /home/`whoami`/.dotfiles/$FILE ]; then
        if [ -f /home/`whoami`/$FILE ]; then
            rm /home/`whoami`/$FILE
        fi
        ln -s /home/`whoami`/.dotfiles/$FILE /home/`whoami`/$FILE
        echo "$FILE: symlinked"
    else
        echo "$FILE: does not exist"
    fi
done

mkdir /home/`whoami`/.vim/backups
mkdir /home/`whoami`/.vim/undodir

mkdir /home/`whoami`/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim .vim/bundle/Vundle.vim
vim +BundleInstall +qall

git clone https://github.com/powerline/fonts.git
bash fonts/install.sh
rm -rf fonts

echo 'done setting up'
