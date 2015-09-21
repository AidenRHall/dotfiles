git pull
git -C .powerline pull
git -C .oh-my-zsh pull

if [ $? -ne 0 ]; then
    echo 'update: git pull failed! not attempting vim plugin update'
    exit 1
fi
echo 'update: git pulled'


vim +BundleUpdate +BundleClean +qall

if [ $? -ne 0 ]; then
    echo 'update: vim plugins failed to update'
    exit 1
fi
echo 'update: vim plugins updated'
