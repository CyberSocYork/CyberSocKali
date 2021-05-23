#/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)
PARENTDIR=$(dirname $SCRIPTPATH)

if [ -d /var/cache/apt-cacher-ng ]; then
	ln -s /var/cache/apt-cacher-ng $PARENTDIR/apt-cacher-ng
else
	sudo mkdir -m 777 $PARENTDIR/apt-cacher-ng
fi
sudo docker run --privileged -it -v /proc:/proc -v $PARENTDIR/images:/home/CyberSocKali/images -v $PARENTDIR/kali-config:/home/CyberSocKali/kali-config -v $PARENTDIR/apt-cacher-ng:/var/cache/apt-cacher-ng cybersoc/build-kali-iso bash -c "/etc/init.d/apt-cacher-ng start; time ./build.sh --verbose;"
