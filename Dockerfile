FROM kalilinux/kali-rolling

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y default-jdk default-jre curl git live-build cdebootstrap fdisk vim time avahi-daemon apt-cacher-ng
RUN mkdir -p /home/CyberSocKali
RUN echo 'Acquire::http::Proxy "http://localhost:3142";' | tee /etc/apt/apt.conf.d/proxy

COPY . /home/CyberSocKali/

WORKDIR /home/CyberSocKali
ENTRYPOINT []
