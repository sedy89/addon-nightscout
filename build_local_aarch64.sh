cd nightscout && docker build --build-arg BUILD_VERSION=1.4.8 --build-arg BUILD_FROM="ghcr.io/hassio-addons/ubuntu-base/aarch64:7.2.0" --build-arg BUILD_ARCH=aarch64 --progress plain --no-cache -t nightscout .
