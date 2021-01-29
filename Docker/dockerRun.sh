#/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)
PARENTDIR=$(dirname $SCRIPTPATH)

sudo docker run --privileged -it -v /proc:/proc -v $PARENTDIR/images:/home/CyberSocKali/images -v $PARENTDIR/kali-config:/home/CyberSocKali/kali-config -v $PARENTDIR/apt-cacher-ng:/var/cache/apt-cacher-ng cybersoc/build-kali-iso bash -c "/etc/init.d/apt-cacher-ng start; time ./build.sh --verbose;"
