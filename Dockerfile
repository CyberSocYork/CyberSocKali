FROM kalilinux/kali-rolling

RUN apt-get update
RUN apt-get install -y default-jdk default-jre curl git live-build cdebootstrap fdisk vim time
RUN mkdir -p /home/CyberSocKali

COPY . /home/CyberSocKali/

WORKDIR /home/CyberSocKali
ENTRYPOINT []
