#!/bin/bash


cd /etc/
OSREL="/etc/os-release"
USERID=$(id -u)

if [ -f "$OSREL" ]
then
	source "$OSREL"
	OSTYPE="$NAME"
else
	OSTYPE=$(uname -v)
fi

if [ "$USERID" != 0 ]
then
	SUDO="sudo"
fi

if [ -z "$OSTYPE" ]
then
	echo "Unable to detect host operating system."
	exit
fi

echo "Detected host operating system: $OSTYPE"

case "$OSTYPE" in
Ubuntu)
	$SUDO apt-get install libsqlite3-dev
	$SUDO apt-get install nodejs
	;;
CentOS*)
	;&
*)
	echo "Unrecognized operating system: $OSTYPE"
	;;
esac


exit
