#!/bin/bash
# repack_all.sh
# This script repacks every installed package into a .deb file
# and moves them into the current directory.
# Store the current directory
original_dir=$(pwd)

# Ensure the script returns to the original directory on exit
trap 'cd ".github/workflows/setup"' EXIT

# Set the target directory to the current directory
TARGET_DIR="."

# Get a list of all installed packages using dpkg-query
PACKAGE_LIST=$(dpkg-query -W -f='${Package}\n')

echo "Repacking all installed packages..."
echo

# Loop over each package and repack it
for pkg in $PACKAGE_LIST; do
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
