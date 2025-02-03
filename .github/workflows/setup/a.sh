#!/bin/bash
# repack_selected.sh
# This script repacks a selected list of packages into .deb files
# and moves them into the current directory.
#
# Make sure dpkg-repack is installed:
#   sudo apt-get install dpkg-repack fakeroot
#
# Define the list of packages to repack.
packages=(
  alien
  build-essential
  capnproto
  ffmpeg
  gcc-arm-none-eabi
  gnome-screenshot
  libavcodec-dev
  libavdevice-dev
  libavfilter-dev
  libavformat-dev
  libavutil-dev
  libbz2-dev
  libcapnp-dev
  libcurl4-openssl-dev
  libeigen3-dev
  libffi-dev
  libglew-dev
  libgles2-mesa-dev
  libglfw3-dev
  liblzma-dev
  libncurses5-dev
  libqt5charts5-dev
  libqt5opengl5-dev
  libqt5serialbus5-dev
  libqt5svg5-dev
  libqt5x11extras5-dev
  libsystemd-dev
  libusb-1.0-0-dev
  libzmq3-dev
  libzstd-dev
  ocl-icd-libopencl1
  ocl-icd-opencl-dev
  opencl-headers
  portaudio19-dev
  pulseaudio
  python3-dev
  python3-tk
  python3-venv
  qt5-qmake
  qtbase5-dev
  qtbase5-dev-tools
  qtchooser
  qttools5-dev-tools
  x11-xserver-utils
)

# Set the target directory to the current directory
TARGET_DIR="."

echo "Repacking selected packages..."
echo

# Loop over each package and repack it
for pkg in "${packages[@]}"; do
    echo "Repacking package: $pkg"
    dpkg-repack "$pkg"
    if [ $? -eq 0 ]; then
        # The resulting file is typically named like pkg_version_arch.deb.
        DEB_FILE=$(ls ${pkg}_*.deb 2>/dev/null)
        if [ -n "$DEB_FILE" ]; then
            echo "Moving $DEB_FILE to $TARGET_DIR/"
            mv "$DEB_FILE" "$TARGET_DIR/"
        else
            echo "Warning: No .deb file found for package $pkg"
        fi
    else
        echo "Error repacking package: $pkg"
    fi
    echo
done

echo "Repacking complete. Check the '$TARGET_DIR' directory for the .deb files."
