#!/bin/bash

# https://github.com/postmodern/chruby

VER="0.3.9"

INST_DIR="$1"

if [ ! -d "$INST_DIR" ]
then
	echo "Please specify the target install directory."
	exit 1
fi

if [ ! -w "$INST_DIR" ]
then
	echo "Install directory $INST_DIR is not writeable, use sudo?"
	exit 1
fi

cd "$INST_DIR"
wget -O "chruby-${VER}.tar.gz" "https://github.com/postmodern/chruby/archive/v${VER}.tar.gz"
tar -xzvf "chruby-${VER}.tar.gz"
cd chruby-${VER}/
sudo make install

exit
