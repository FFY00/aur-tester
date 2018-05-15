#!/bin/bash
set -e
docker run --rm -it \
    -v "$(pwd)/scripts:/opt/scripts" \
    base/archlinux \
    /opt/scripts/install.sh $@
