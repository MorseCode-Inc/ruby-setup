#!/bin/sh


PLUGS="
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
"

DIRECTIVES="
set ai
set tabstop=2
set shiftwidth=2
set expandtab
syntax enable
filetype on
filetype indent on
filetype plugin on
set background=dark
colorscheme solarized
let g:syntastic_ruby_mri_exec = '~/.rubies/ruby-2.3.0/bin/ruby'
"

if [ -z "$HOME" ]
then
  HOME="/home/$USER"
  if [ ! -d "$HOME" ]
  then
    echo "$HOME does not exist." >&2
    exit
  fi
fi

make_dir() {
  if [ ! -d "$1" ]
  then
    mkdir -p "$1"
  fi
}

if [ ! -f "$HOME/.vimrc" ]
then
  touch "$HOME/.vimrc"
fi

make_dir "$HOME/.vim/bundle"
make_dir "$HOME/.vim/colors"
make_dir "$HOME/.vim/autoload"

# install Plug support
# https://github.com/junegunn/vim-plug
if [ -z "$(grep "call plug#begin(" "$HOME/.vimrc")" ]
then
  curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >/dev/null
  echo "call plug#begin('$HOME/.vim/plugged')" >> $HOME/.vimrc
  echo "call plug#end()" >> $HOME/.vimrc
fi


# install vim-colors-solarized
if [ ! -d $HOME/.vim/bundle/vim-colors-solarized ]
then
  git clone git://github.com/altercation/vim-colors-solarized.git "$HOME/.vim/bundle/vim-colors-solarized"
  ln -s "$HOME/.vim/bundle/vim-colors-solarized/colors/solarized.vim" "$HOME/.vim/colors"
fi


echo "$PLUGS" | while read PLUG WHAT COMMAND
do
  EXISTS=$(grep "$PLUG $WHAT" "$HOME/.vimrc")
  if [ -z "$EXISTS" ]
  then
    echo "$PLUG $WHAT $COMMAND"
  fi
done

echo "$DIRECTIVES" | while read INSRUCTION
do
  EXISTS=$(grep "$INSRUCTION" "$HOME/.vimrc")
  if [ -z "$EXISTS" ]
  then
    echo "$INSRUCTION"
  fi
done


cat << EOF
EOF

exit
