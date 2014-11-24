if [ ! -d ~/.dotfiles ]; then
    echo "exiting: ~/.dotfiles does not exist"
    exit 1
fi

declare -a FILES=('.vimrc'
                  '.vim'
                  '.zshrc'
                  '.aliases')

for FILE in "${FILES[@]}"
do
    if [ -f ~/.dotfiles/$FILE ]; then
        if [ -f ~/$FILE ]; then
            rm ~/$FILE
        fi
        ln -s ~/.dotfiles/$FILE ~/$FILE
        echo "$FILE: symlinked"
    else
        echo "$FILE: does not exist"
    fi
done

mkdir ~/.vim_backups

echo 'done setting up'
