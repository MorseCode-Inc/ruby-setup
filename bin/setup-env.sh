#!/bin/bash

INSTALLED=$(grep chruby ~/.bashrc)

if [ -n "$INSTALLED" ]
then
	echo "Looks like this has already been installed in your environment, found 'chruby' in ~/.bashrc"
	exit
fi

cat << EOF >> ~/.bashrc
source /usr/local/share/chruby/chruby.sh
chruby ruby 2.3.0
EOF

exit
