#!/bin/sh -e

MY_USER="$(whoami)"
DEFCONFIG="beaglebone_defconfig"
MY_HOME="/home/${MY_USER}"
BR_DIR="${MY_HOME}/buildroot"
BRANCH="2020.11.x"

sudo chown "${MY_USER}:${MY_USER}" -R "${BR_DIR}"

FIRST="$(ls -A "${BR_DIR}")"
if [ -z "${FIRST}" ]; then
    cd "${BR_DIR}"
    ## get (my) sources
    ## NB: the official buildroot is not able to build cross-mounted devices (thus using my patched buildroot tree)
    git clone -j4 --depth=1 --branch "lothar/${BRANCH}" https://github.com/Rubusch/buildroot.git
    ## oficial buildroot (won't work due to Kbuild's use of "rename()" for moving files which is not able to move cross-device (mounted folder)
    #RUN cd /home/$USER && git clone -j4 --depth=1 --branch ${BRANCH} https://github.com/buildroot/buildroot.git buildroot
fi

cd "${BR_DIR}"
make defconfig "${DEFCONFIG}"
make -j"$(nproc)"

echo "READY."
echo
