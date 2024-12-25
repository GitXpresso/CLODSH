#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

# Set same default compilation flags as abuild.
export CFLAGS="-Os -fomit-frame-pointer"
export CXXFLAGS="$CFLAGS"
export CPPFLAGS="$CFLAGS"
export LDFLAGS="-Wl,--strip-all -Wl,--as-needed"

export CC=xx-clang
export CXX=xx-clang++

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

function log {
    echo ">>> $*"
}

MEDIAINFOLIB_URL="$1"
ZENLIB_URL="$2"

if [ -z "$MEDIAINFOLIB_URL" ]; then
    log "ERROR: MediaInfoLib URL missing."
    exit 1
fi

if [ -z "$ZENLIB_URL" ]; then
    log "ERROR: ZenLib URL missing."
    exit 1
fi

#
# Install required packages.
#
apk --no-cache add \
    curl \
    clang \
    make \
    autoconf \
    automake \
    libtool \
    pkgconf \

xx-apk --no-cache --no-scripts add \
    musl-dev \
    gcc \
    g++ \
    tinyxml2-dev \
    zlib-dev \

#
# Download sources.
#

log "Downloading MediaInfoLib package..."
mkdir /tmp/MediaInfoLib
curl -# -L -f ${MEDIAINFOLIB_URL} | tar xJ --strip 1 -C /tmp/MediaInfoLib
rm -r \
    /tmp/MediaInfoLib/Project/MS* \
    /tmp/MediaInfoLib/Project/zlib \
    /tmp/MediaInfoLib/Source/ThirdParty/tinyxml2 \

log "Downloading ZenLib package..."
mkdir /tmp/ZenLib
curl -# -L -f ${ZENLIB_URL} | tar xz --strip 1 -C /tmp/ZenLib

#
# Compile ZenLib
#

log "Configuring ZenLib..."
(
    cd /tmp/ZenLib/Project/GNU/Library && \
    ./autogen.sh && \
    ./configure \
        --build=$(TARGETPLATFORM= xx-clang --print-target-triple) \
        --host=$(xx-clang --print-target-triple) \
        --prefix=/usr \
        --disable-static \
        --enable-shared \
)

log "Compiling ZenLib..."
make -C /tmp/ZenLib/Project/GNU/Library -j$(nproc)

log "Installing ZenLib..."
make DESTDIR=/tmp/libmediainfo-install -C /tmp/ZenLib/Project/GNU/Library install

#
# Compile MediaInfoLib
#

log "Configuring MediaInfoLib..."
(
    cd /tmp/MediaInfoLib/Project/GNU/Library && \
    ./autogen.sh && \
    ./configure \
        --build=$(TARGETPLATFORM= xx-clang --print-target-triple) \
        --host=$(xx-clang --print-target-triple) \
        --prefix=/usr \
        --disable-static \
        --enable-shared \
        --with-libtinyxml2 \
)

log "Compiling MediaInfoLib..."
make -C /tmp/MediaInfoLib/Project/GNU/Library -j$(nproc)

log "Installing MediaInfoLib..."
make DESTDIR=/tmp/libmediainfo-install -C /tmp/MediaInfoLib/Project/GNU/Library install

log "Cleaning installation..."
find /tmp/libmediainfo-install/usr/lib -mindepth 1 -not -name "*.so*" -exec echo "Removing {}..." ';' -delete
