#!/bin/sh

if [ ! -f ~/.vimrc ]
then
  touch ~/.vimrc
fi

# install Plug support
# https://github.com/junegunn/vim-plug
if [ -z "$(grep "call plug#begin(" ~/.vimrc)" ]
then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >/dev/null
  echo "call plug#begin('~/.vim/plugged')" >> ~/.vimrc
  echo "call plug#end()" >> ~/.vimrc
fi

PLUGS="
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"

echo "$PLUGS" | while read PLUG WHAT COMMAND
do
  EXISTS=$(grep "$PLUG $WHAT" ~/.vimrc)
  if [ -z "$EXISTS" ]
  then
    echo "$PLUG $WHAT $COMMAND"
  fi
done


cat << EOF
EOF

exit
