#!/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
set -e
dpkg --add-architecture armhf
dpkg --add-architecture arm64
>/dev/null pushd $SCRIPT_DIR 
cp arm-cross-compile-sources.list /etc/apt/sources.list.d/
>/dev/null popd 
sed -e 's/deb http/deb [arch=amd64] http/g' -i /etc/apt/sources.list
echo "You can now 'apt update' and then install an arm package with 'apt install <pkg>:arm64'"
