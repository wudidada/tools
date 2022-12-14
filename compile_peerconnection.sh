#!/bin/sh

ARM64_OUT="out/arm64"
ARM64_RELEASE="out/arm64_release"
ARM32_OUT="out/arm32"
ARM32_RELEASE="out/arm32_release"

if [ -z "${RTC_BASE}" ]
then
    echo "RTC_BASE not set"
    exit 1
fi

cd $RTC_BASE || exit 1
gclient sync

echo "=========== compile arm64 debug version ==========="
gn gen ${ARM64_OUT} --args='target_os="android" target_cpu="arm64"'
ninja -C ${ARM64_OUT} sdk/android || exit 1

echo "=========== compile arm64 release version ==========="
gn gen ${ARM64_RELEASE} --args='is_debug=false is_component_build=false rtc_include_tests=false target_os="android" target_cpu="arm64"'
ninja -C ${ARM64_RELEASE} sdk/android || exit 1

echo "=========== compile arm32 debug version ==========="
gn gen ${ARM32_OUT} --args='target_os="android" target_cpu="arm"'
ninja -C ${ARM32_OUT} sdk/android || exit 1

echo "=========== compile arm32 release version ==========="
gn gen ${ARM32_RELEASE} --args='is_debug=false is_component_build=false rtc_include_tests=false target_os="android" target_cpu="arm"'
ninja -C ${ARM32_RELEASE} sdk/android || exit 1
