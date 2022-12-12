#!/bin/sh

git clone /src /work
cd /work

cd libdispatch-5.5 && rm -rf !\("debian"\) && mk-build-deps -i -t "apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends -y" && cd ..
cd libobjc2-2.1.20220927 && rm -rf !\("debian"\) && mk-build-deps -i -t "apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends -y" && cd ..
cd gnustep-make-2.9.0 && rm -rf !\("debian"\) && mk-build-deps -i -t "apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends -y" && cd ..
cd gnustep-base-1.28.20221209 && rm -rf !\("debian"\) && mk-build-deps -i -t "apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends -y" && cd ..

git clean -xfd .

wget -nv -nc https://github.com/apple/swift-corelibs-libdispatch/archive/refs/tags/swift-5.5-RELEASE.tar.gz -O libdispatch_5.5.orig.tar.gz
wget -nv -nc https://github.com/gnustep/libobjc2/archive/35ac9bc072e652e8bac9cd501f94d3b089b8f9a2.tar.gz -O libobjc2_2.1.20220927.orig.tar.gz
wget -nv -nc https://github.com/gnustep/tools-make/releases/download/make-2_9_0/gnustep-make-2.9.0.tar.gz -O gnustep-make_2.9.0.orig.tar.gz
wget -nv -nc https://github.com/gnustep/libs-base/archive/91108c69c3fbc4f6a71497966c4bab0461265d1b.tar.gz -O gnustep-base_1.28.20221209.orig.tar.gz
wget -nv -nc https://github.com/gnustep/libs-gui/archive/67d27cd4535e5e14b697f8def909807c8255a023.tar.gz -O gnustep-gui_0.29.20221128.orig.tar.gz

cd libdispatch-5.5 && git clean -xfd . && tar -xvzf ../libdispatch_5.5.orig.tar.gz --strip-components=1 && debuild -us -uc && cd ..
dpkg -i libdispatch0_5.5-1_amd64.deb
dpkg -i libdispatch-dev_5.5-1_amd64.deb

cd libobjc2-2.1.20220927 && git clean -xfd . && tar -xvzf ../libobjc2_2.1.20220927.orig.tar.gz --strip-components=1 && debuild -us -uc && cd ..
dpkg -i libobjc2_2.1.20220927-1_amd64.deb
dpkg -i libobjc2-dev_2.1.20220927-1_amd64.deb

cd gnustep-make-2.9.0 && git clean -xfd . && tar -xvzf ../gnustep-make_2.9.0.orig.tar.gz --strip-components=1 && debuild -us -uc && cd ..
dpkg -i gnustep-make_2.9.0-1_amd64.deb

cd gnustep-base-1.28.20221209 && git clean -xfd . && tar -xvzf ../gnustep-base_1.28.20221209.orig.tar.gz --strip-components=1 && DEB_BUILD_OPTIONS=nocheck debuild -us -uc && cd ..
dpkg -i libgnustep-base1.28_1.28.20221209-1_amd64.deb
dpkg -i libgnustep-base-dev_1.28.20221209-1_amd64.deb

cd gnustep-gui-0.29.20221128 && git clean -xfd . && tar -xvzf ../gnustep-gui_0.29.20221128.orig.tar.gz --strip-components=1 && DEB_BUILD_OPTIONS=nocheck debuild -us -uc && cd ..
