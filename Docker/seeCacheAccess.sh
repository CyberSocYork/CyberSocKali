sudo docker exec -it $(sudo docker container ls | grep "cybersoc/build-kali-iso" | cut -d' ' -f 1,2) tail -f /var/log/apt-cacher-ng/apt-cacher.log
