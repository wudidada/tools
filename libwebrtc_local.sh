#!/bin/zsh

WEB_RTC_BASE=~/Code/webrtc/src
SDK_BASE="${WEB_RTC_BASE}/sdk"
NINJA_DIR="${WEB_RTC_BASE}/out/arm64"

if [ $# -eq 0 ]
then
    out_dir=~/Downloads/webrtc
elif [ $# -eq 1 -a $1 = '-z' ]
then
    out_dir=libwebrtc
else
    for var in $@
    do
        if [ $var != '-z' ]
        then
            out_dir="$var/libwebrtc"
            break
        fi
    done
fi

# copy .java
java_dir=$out_dir/java/org/webrtc
mkdir -p $java_dir

cp -Rvp ${SDK_BASE}/**/java/org/webrtc/* ${java_dir}
cp -Rvp ${SDK_BASE}/**/api/org/webrtc/* ${java_dir}
cp -Rvp ${WEB_RTC_BASE}/rtc_base/**/org/webrtc/* ${java_dir}
cp -Rvp ${WEB_RTC_BASE}/modules/**/org/webrtc/* ${java_dir}

# cp -Rvp ${NINJA_DIR}/gen/**/org/webrtc/* ${java_dir}

rm -rf ${java_dir}/**/examples
rm -rf ${java_dir}/**/native_test
rm $java_dir/**/R.java

# copy .so
# jni_dir=$out_dir/jni
# mkdir -p $jni_dir

# cp -vp $NINJA_DIR/libjingle_peerconnection_so.so $jni_dir

# copy AndroidManifest.xml
# cp -vp ${WEB_RTC_BASE}/sdk/android/instrumentationtests/AndroidManifest.xml ${out_dir}

# while getopts "z" opt; do
#   case $opt in
#      z)
#        tar -zcf $out_dir.tar.gz $out_dir
#        ;;
#   esac
# done