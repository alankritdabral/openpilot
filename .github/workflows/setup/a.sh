#!/bin/bash

# List of packages to install
packages=(
    ca-certificates 
    clang 
    build-essential 
    gcc-arm-none-eabi 
    liblzma-dev 
    capnproto 
    libcapnp-dev 
    curl 
    libcurl4-openssl-dev 
    git 
    git-lfs 
    ffmpeg 
    libavformat-dev 
    libavcodec-dev 
    libavdevice-dev 
    libavutil-dev 
    libavfilter-dev 
    libbz2-dev 
    libeigen3-dev 
    libffi-dev 
    libglew-dev 
    libgles2-mesa-dev 
    libglfw3-dev 
    libglib2.0-0 
    libqt5charts5-dev 
    libncurses5-dev 
    libssl-dev 
    libusb-1.0-0-dev 
    libzmq3-dev 
    libzstd-dev
    libsqlite3-dev 
    libsystemd-dev 
    locales 
    opencl-headers 
    ocl-icd-libopencl1 
    ocl-icd-opencl-dev 
    portaudio19-dev 
    qttools5-dev-tools 
    libqt5svg5-dev
    libqt5serialbus5-dev 
    libqt5x11extras5-dev 
    libqt5opengl5-dev 
    g++-12 
    qtbase5-dev 
    qtchooser 
    qt5-qmake 
    qtbase5-dev-tools 
    python3-dev 
    python3-venv
)

# Number of parallel processes
num_parallel=4

# Export DEBIAN_FRONTEND to suppress prompts during installation
export DEBIAN_FRONTEND=noninteractive

# Install packages in parallel
echo "Starting parallel installation of packages..."
printf "%s\n" "${packages[@]}" | xargs -n 1 -P "$num_parallel" sudo apt-get install -y

echo "Package installation completed."
