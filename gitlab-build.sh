#!/usr/bin/bash

set -o errexit
set -o pipefail
set -o nounset

echo "Starting pipeline for commit ${CI_COMMIT_SHORT_SHA}"

upload_image () {
    curl --header "JOB-TOKEN: $CI_JOB_TOKEN" --upload-file release/OpenVoiceOS_rpi4_64-ca.img.xz "${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/packages/generic/ovos-ca/${CI_COMMIT_SHORT_SHA}/OpenVoiceOS_rpi4_64-ca.img.xz"
    echo "Image uploaded successfully"
}


if [[ -f ${CI_COMMIT_SHORT_SHA} ]]; then
    echo "Pipeline was already run, skipping clean"
else
    echo "Pipeline first-run, deinit submodules"
    git submodule deinit -f .
    echo "Initializing submodules"
    git submodule sync --recursive
    git submodule update --init --recursive
    echo "Cleaning"
    git clean -x -f -e ccache -e downloads
    echo "Applying patches"
    bash ./scripts/br-patches.sh
    echo "Make clean"
    make clean
    echo "Make config"
    make rpi4_64-ca-config
    echo "Touching file ${CI_COMMIT_SHORT_SHA}"
    touch "${CI_COMMIT_SHORT_SHA}"
fi

if [[ -f ./release/OpenVoiceOS_rpi4_64-ca.img.xz ]]; then
    echo "Image already exists, attempting upload"
    upload_image
    exit 0
fi

if ! make rpi4_64-ca ; then
    echo "First make failed, trying to fix and rerun"
    sed -i 's/_qt5gui_find_extra_libs(OPENGL "GLESv2" "" "")/_qt5gui_find_extra_libs(OPENGL "${CMAKE_SYSROOT}\/usr\/lib\/libGLESv2.so" "" "${CMAKE_SYSROOT}\/usr\/include\/libdrm")/g' buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/cmake/Qt5Gui/Qt5GuiConfigExtras.cmake
    make rpi4_64-ca
fi

echo "Make finished, attempting upload"
upload_image