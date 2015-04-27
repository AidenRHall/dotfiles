git pull

if [ $? -eq 0 ]; then
    echo 'update: git pulled'

    vim +BundleUpdate +qall
    if [ $? -eq 0 ]; then
        echo 'update: vim plugins updated'
    else
        echo 'update: vim plugins failed to update'
        exit 1
    fi

    bash .vim/bundle/YouCompleteMe/install.sh

else
    echo 'update: git pull failed! not attempting vim plugin update'
    exit 1
fi
