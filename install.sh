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
                  '.aliases'
                  '.tmux.conf')

for FILE in "${FILES[@]}"
do
    if [ -f $HOME/.dotfiles/$FILE -o -d $HOME/.dotfiles/$FILE ]; then
        if [ -f $HOME/$FILE -o -d $HOME/$FILE ]; then
            echo "Calling mv $HOME/$FILE{,.bak}"
            mv $HOME/$FILE{,.bak}
        fi
        ln -s $HOME/.dotfiles/$FILE $HOME/$FILE
        echo "$FILE: symlinked"
    else
        echo "$FILE: does not exist"
    fi
done


echo "Setup successful!"
