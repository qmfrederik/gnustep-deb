#!/bin/sh
git clean -xfd .

wget -nv -nc https://github.com/apple/swift-corelibs-libdispatch/archive/refs/tags/swift-5.5-RELEASE.tar.gz -O libdispatch_5.5.orig.tar.gz
wget -nv -nc https://github.com/gnustep/libobjc2/archive/35ac9bc072e652e8bac9cd501f94d3b089b8f9a2.tar.gz -O libobjc2_2.1.20220927.orig.tar.gz
wget -nv -nc https://github.com/gnustep/tools-make/releases/download/make-2_9_0/gnustep-make-2.9.0.tar.gz -O gnustep-make_2.9.0.orig.tar.gz
wget -nv -nc https://github.com/gnustep/libs-base/archive/91108c69c3fbc4f6a71497966c4bab0461265d1b.tar.gz -O gnustep-base_1.28.20221209.orig.tar.gz

export DEB_BUILD_OPTIONS=nocheck

cd libdispatch-5.5 && rm -rf !\("debian"\) && tar -xvzf ../libdispatch_5.5.orig.tar.gz --strip-components=1 && debuild -us -uc && cd ..
cd libobjc2-2.1.20220927 && rm -rf !\("debian"\) && tar -xvzf ../libobjc2_2.1.20220927.orig.tar.gz --strip-components=1 && debuild -us -uc && cd ..
cd gnustep-make-2.9.0 && rm -rf !\("debian"\) && tar -xvzf ../gnustep-make_2.9.0.orig.tar.gz --strip-components=1 && debuild -us -uc && cd ..
cd gnustep-base-1.28.20221209 && rm -rf !\("debian"\) && tar -xvzf ../gnustep-base_1.28.20221209.orig.tar.gz --strip-components=1 && debuild -us -uc && cd ..
