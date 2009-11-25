#!/bin/bash



which cpp 2>&1 > /dev/null || (echo "cpp not found in path"; exit 1) 2>&1 

echo "What default email do you want on this machine?"
read EMAIL

cp  dot_gitignore.in  ~/.gitignore
cpp -P -undef -DHOME=`echo ~` -DEMAIL="$EMAIL" dot_gitconfig.in > ~/.gitconfig