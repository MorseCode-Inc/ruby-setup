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

if [ -z "$OSTYPE" ]
then
	echo "Unable to detect host operating system."
	exit
fi

echo "Detected host operating system: $OSTYPE"

case "$OSTYPE"
Ubuntu)
	apt-get install libsqlite3-dev
	;;
CentOS*)
	;&
*)
	echo "Unrecognized operating system: $OSTYPE"
	;;
esac


exit
