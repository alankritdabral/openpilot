import subprocess
import multiprocessing

# List of dependencies to install
dependencies = [
    "ca-certificates", "clang", "build-essential", "gcc-arm-none-eabi", "liblzma-dev", "capnproto", "libcapnp-dev",
    "curl", "libcurl4-openssl-dev", "git", "git-lfs", "ffmpeg", "libavformat-dev", "libavcodec-dev", "libavdevice-dev",
    "libavutil-dev", "libavfilter-dev", "libbz2-dev", "libeigen3-dev", "libffi-dev", "libglew-dev", "libgles2-mesa-dev",
    "libglfw3-dev", "libglib2.0-0", "libqt5charts5-dev", "libncurses5-dev", "libssl-dev", "libusb-1.0-0-dev",
    "libzmq3-dev", "libzstd-dev", "libsqlite3-dev", "libsystemd-dev", "locales", "opencl-headers", "ocl-icd-libopencl1",
    "ocl-icd-opencl-dev", "portaudio19-dev", "qttools5-dev-tools", "libqt5svg5-dev", "libqt5serialbus5-dev",
    "libqt5x11extras5-dev", "libqt5opengl5-dev", "g++-12", "qtbase5-dev", "qtchooser", "qt5-qmake",
    "qtbase5-dev-tools", "python3-dev", "python3-venv"
]

# Function to install a single package
def install_package(package):
    try:
        print(f"Installing {package}...")
        subprocess.run(["sudo", "apt-get", "install", "-y", package], check=True)
        print(f"{package} installed successfully.")
    except subprocess.CalledProcessError:
        print(f"Failed to install {package}.")

# Multiprocessing to install packages
def install_packages_parallel():
    with multiprocessing.Pool(processes=multiprocessing.cpu_count()) as pool:
        pool.map(install_package, dependencies)

if __name__ == "__main__":
    print("Updating package list...")
    subprocess.run(["sudo", "apt-get", "update", "-y"], check=True)

    print("Installing dependencies in parallel...")
    install_packages_parallel()

    print("All dependencies installation attempted.")
