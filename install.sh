#!/bin/bash



which cpp 2>&1 > /dev/null || (echo "cpp not found in path"; exit 1) 2>&1 

if [ -f ~/.gitconfig ]; then
  echo "********************************************************"
  echo "*** This will overwrite anything that already exists ***"
  echo "********************************************************"

  echo -n "Are you sure you wish to proceed? (y/N)? "
  read CONFIRM
  CONFIRM=$(echo $CONFIRM | tr '[:upper:]' '[:lower:]')

  case $CONFIRM in
      y|yes)
	  ;;
      *)
	  echo "Exiting"
	  exit 1
	  ;;
  esac
fi
  

echo "What default email do you want on this machine?"
read EMAIL

cp  dot_gitignore.in  ~/.gitignore
cpp -P -undef -DHOME=`echo ~` -DEMAIL="$EMAIL" dot_gitconfig.in > ~/.gitconfig