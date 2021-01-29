# CyberSoc Kali

A customised build of [Kali Linux](https://www.kali.org/), created by and for [CyberSoc](https://cybersoc.co.uk/), for use at our sessions.

## Changes from a standard Kali image

- KDE Plasma is the default desktop environment.
- SDDM is the default display manager.
- A customised zshrc, loosely based on the one from [Sciencentistguy's dotfiles](https://github.com/Sciencentistguy/dotfiles)
- Custom CyberSoc-branded wallpaper.
- Some added tools:
  - [Ghidra](https://github.com/NationalSecurityAgency/ghidra)
  - [Linpeas](https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/linPEAS)
  - [chntpw](https://gitlab.com/kalilinux/packages/chntpw)
  - [checksec](https://github.com/slimm609/checksec.sh)

## Usage

### Release builds

We provide releases occasionally, with pre-built `.iso`s available for download. We build these with the `kali-linux-everything` metapackage, so they are very large (over `10GiB`). To use this:

- Download the `.iso` file from the Google Drive link in the tagged release.
- Write it to a USB stick with your preferred method. On macOS or Linux, we recommend using the `dd` utility, and on Windows, we recommend [Rufus](https://rufus.ie/).

### Custom builds

If you want a more recent build than the most recent release, or you want to customise the build (to, for example, reduce the final size of the image), you can build it yourself from this repo.

#### Customising

To reduce the size of the final image, change the metapackage used as a base. This is done by editing the file `./kali-config/variant-cybersoc/package-lists/kali.list.chroot` and changing `kali-linux-everything` to a [different metapackage](https://www.kali.org/docs/general-use/metapackages/).

#### Building

- If your system has `dpkg`:
  - Install `live-build` and `cdebootstrap` from your distro's repositories.
  - Run `sudo ./build.sh --variant cybersoc --verbose`. This will download all the packages from the official Kali Linux repositories, and build the image.
- If your system does not have `dpkg`, but is Linux-based:
  - Install and start [docker](https://www.docker.com/).
  - Run `sudo ./Docker/dockerBuild.sh`. This will create the Kali Linux docker environment to build the image in. This command only needs to be run once, subsequent builds will re-use the same docker container.
  - Run `sudo ./Docker/dockerRun.sh`. This will download all the packages from the official Kali Linux repositories, and build the image.
- The completed image will be placed in `images/`
- If your system is not based on Linux:
  - Unfortunately, we cannot provide build instructions for you. The easiest way to build this is probably from inside a Kali Linux VM.

---

The files in this repository are available under the GNU GPL.

Our configuration is based on Kali Linux's [live-build-config](https://gitlab.com/kalilinux/build-scripts/live-build-config), which is in turn based on Debian's [live build](https://salsa.debian.org/live-team/live-build).
