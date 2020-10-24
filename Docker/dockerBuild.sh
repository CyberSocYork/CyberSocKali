#/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)
PARENTDIR=$(dirname $SCRIPTPATH)

rm $PARENTDIR/images/*

docker build $PARENTDIR -t cybersoc/build-kali-iso
