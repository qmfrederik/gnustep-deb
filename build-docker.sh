#!/bin/sh

docker build docker/ -t gnustep-deb
docker run --rm -it -v $(pwd):/src gnustep-deb /bin/bash