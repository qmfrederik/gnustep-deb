#!/bin/sh
set -e

cd /
rm -rf /work
git clone /src /work
cd /work

wget -nv -nc https://github.com/apple/swift-corelibs-libdispatch/archive/refs/tags/swift-5.5-RELEASE.tar.gz -O libdispatch_5.5.orig.tar.gz
wget -nv -nc https://github.com/gnustep/libobjc2/archive/35ac9bc072e652e8bac9cd501f94d3b089b8f9a2.tar.gz -O libobjc2_2.1.20220927.orig.tar.gz
wget -nv -nc https://github.com/gnustep/tools-make/releases/download/make-2_9_0/gnustep-make-2.9.0.tar.gz -O gnustep-make_2.9.0.orig.tar.gz
wget -nv -nc https://github.com/gnustep/libs-base/archive/47b6e9d052498c386cd20aa33059bc998181eacd.tar.gz -O gnustep-base_1.28.20221211.orig.tar.gz
wget -nv -nc https://github.com/gnustep/libs-gui/archive/67d27cd4535e5e14b697f8def909807c8255a023.tar.gz -O gnustep-gui_0.29.20221128.orig.tar.gz
wget -nv -nc https://github.com/gnustep/libs-back/releases/download/back-0_30_0/gnustep-back-0.30.0.tar.gz -O gnustep-back_0.30.0.orig.tar.gz
wget -nv -nc https://github.com/gnustep/apps-systempreferences/archive/refs/tags/systempreferences-1_2_0.tar.gz -O gnustep-systempreferences_1.2.0.orig.tar.gz

cd /work/libdispatch-5.5 && git clean -xfd . && mk-build-deps -i -t "apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends -y" && git clean -xfd . && tar -xvzf ../libdispatch_5.5.orig.tar.gz --strip-components=1 && debuild -us -uc
cd /work/ && dpkg -i libdispatch0_5.5-1_amd64.deb && dpkg -i libdispatch-dev_5.5-1_amd64.deb

cd /work/libobjc2-2.1.20220927 && git clean -xfd . && mk-build-deps -i -t "apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends -y" && git clean -xfd . && tar -xvzf ../libobjc2_2.1.20220927.orig.tar.gz --strip-components=1 && debuild -us -uc
cd /work/ && dpkg -i libobjc2_2.1.20220927-1_amd64.deb && dpkg -i libobjc2-dev_2.1.20220927-1_amd64.deb

cd /work/gnustep-make-2.9.0 && git clean -xfd . && mk-build-deps -i -t "apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends -y" && git clean -xfd . && tar -xvzf ../gnustep-make_2.9.0.orig.tar.gz --strip-components=1 && debuild -us -uc
cd /work/ && dpkg -i gnustep-make_2.9.0-2_amd64.deb

cd /work/gnustep-base-1.28.20221211 && git clean -xfd . && mk-build-deps -i -t "apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends -y" && git clean -xfd . && tar -xvzf ../gnustep-base_1.28.20221211.orig.tar.gz --strip-components=1 && debuild -us -uc
cd /work/ && dpkg -i libgnustep-base1.28_1.28.20221211-1_amd64.deb && dpkg -i libgnustep-base-dev_1.28.20221211-1_amd64.deb

cd /work/gnustep-gui-0.29.20221128 && git clean -xfd . && mk-build-deps -i -t "apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends -y" && git clean -xfd . && tar -xvzf ../gnustep-gui_0.29.20221128.orig.tar.gz --strip-components=1 && debuild -us -uc
cd /work/ && dpkg -i libgnustep-gui0.29_0.29.20221128-2_amd64.deb && dpkg -i libgnustep-gui-dev_0.29.20221128-2_amd64.deb

cd /work/gnustep-back-0.30.0 && git clean -xfd . && mk-build-deps -i -t "apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends -y" && git clean -xfd . && tar -xvzf ../gnustep-back_0.30.0.orig.tar.gz --strip-components=1 && debuild -us -uc
cd /work/ && dpkg -i gnustep-back_0.30.0-1_amd64.deb
