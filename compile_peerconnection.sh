#!/bin/sh

ARM64_OUT="out/arm64"
ARM64_RELEASE="out/arm64_release"

if [ -z "${RTC_BASE}" ]
then
    echo "RTC_BASE not set"
    exit 1
fi

cd $RTC_BASE || exit 1
gclient sync

echo "=========== compile debug version ==========="
gn gen ${ARM64_OUT} --args='target_os="android" target_cpu="arm64"'
ninja -C ${ARM64_OUT} libjingle_peerconnection_so

echo "=========== compile release version ==========="
gn gen ${ARM64_RELEASE} --args='is_debug=false is_component_build=false rtc_include_tests=false target_os="android" target_cpu="arm64"'
ninja -C ${ARM64_RELEASE} libjingle_peerconnection_so
