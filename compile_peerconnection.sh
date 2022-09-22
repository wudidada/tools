#!/bin/sh

if [ -z "${RTC_BASE}" ]
then
    echo "RTC_BASE not set"
    exit 1
fi

cd $RTC_BASE || exit 1
gn gen out/arm64_new --args='target_os="android" target_cpu="arm64"'
ninja -C out/arm64_new libjingle_peerconnection_so