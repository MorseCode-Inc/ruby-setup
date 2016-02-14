#!/bin/bash

INST_DIR="/usr/local/share"
CONF_DIR="/usr/local/etc"

if [ ! -d "$INST_DIR" ]
then
	echo "Install directory '$INST_DIR' does not exist."
	exit 1
fi

if [ ! -w "$INST_DIR" ]
then
	echo "Install directory $INST_DIR is not writeable, use sudo?"
	exit 1
fi

if [ -z "$(type wemux 2>/dev/null)" ]
then
	echo "You may need to install tmux."
fi

if [ ! -d "$INST_DIR"/wemux ]
then
	git clone git://github.com/zolrath/wemux.git "$INST_DIR"/wemux
	ln -s "$INST_DIR"/wemux/wemux /usr/local/bin/wemux
else
	cd "$INST_DIR"/wemux
	git pull
fi

if [ ! -e "$CONF_DIR/wemux.conf" ]
then
	cp "$INST_DIR"/wemux/wemux.conf.example "$CONF_DIR"/wemux.conf
	ln -s "$CONF_DIR"/wemux.conf /etc/wemux.conf
fi

echo "Edit $CONF_DIR/wemux.conf to finish configuring wemux." 

exit
