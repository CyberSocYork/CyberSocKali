# CyberSoc Kali

## How to Build
- Clone this repo
- run `sudo ./build.sh --variant cybersoc --verbose`
- The ISO will be in the `images` directory

### Docker Build
- Clone this repo
- Install docker
- Run `sudo ./Docker/dockerBuild.sh` to build the container
- Run `sudo ./Docker/dockerRun.sh` to roll the iso
- The ISO will be in the `images` directory
- NOTE: You only have to build once, any changes in the `kali-config` directory will be reflected in subsequent builds

### Based on the Kali Linux [live-build-config](https://gitlab.com/kalilinux/build-scripts/live-build-config)
