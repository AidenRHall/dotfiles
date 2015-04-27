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

else
    echo 'update: git pull failed! not attempting vim plugin update'
    exit 1
fi
