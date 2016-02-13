#!/bin/bash

VER="0.6.0"

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
wget -O "ruby-install-${VER}.tar.gz" "https://github.com/postmodern/ruby-install/archive/v${VER}.tar.gz"
tar -xzvf "ruby-install-${VER}.tar.gz"
cd "ruby-install-${VER}/"
make install
install-ruby

exit
