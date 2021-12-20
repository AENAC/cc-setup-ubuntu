#!/bin/sh
dpkg --add-architecture armhf
dpkg --add-architecture arm64
cp arm-cross-compile-sources.list /etc/apt/sources.list.d/
cp /etc/apt/sources.list /etc/apt/sources.list.old
sed -e 's/deb http/deb [arch=amd64] http/g' -i /etc/apt/sources.list
echo "You can now 'apt update' and then install an arm package with 'apt install <pkg>:arm64'"
