#/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)
PARENTDIR=$(dirname $SCRIPTPATH)


sudo docker run --privileged -it -v /proc:/proc -v $PARENTDIR/images:/home/CyberSocKali/images -v $PARENTDIR/kali-config:/home/CyberSocKali/kali-config cybersoc/build-kali-iso ./build.sh --variant cybersoc --verbose
