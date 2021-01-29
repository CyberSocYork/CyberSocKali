#/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)
PARENTDIR=$(dirname $SCRIPTPATH)

ls $PARENTDIR/images/*

docker build $PARENTDIR -t cybersoc/build-kali-iso
