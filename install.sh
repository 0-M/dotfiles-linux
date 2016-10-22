#!/bin/bash
echo "You are about to install:"
ls -la "$( dirname "${BASH_SOURCE[0]}" )" | grep -v "install.sh" | grep -v "^d" | grep -v "LICENSE"

read -p "to your home directory. Continue? (Y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  cd $THIS_DIR

  rsync -rv --exclude=install.sh --exclude=LICENSE --exclude=.git . ~/
fi
