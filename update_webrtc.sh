#!/bin/sh

# set -x

WEBRTC_SRC='/Users/jusbin/Code/src'
if [ "$RTC_BASE" ]
then 
    WEBRTC_SRC=$RTC_BASE
fi


if [ ! -d $WEBRTC_SRC ]
then
    echo "webrtc src not exists: ${WEBRTC_SRC}"
    exit 1
fi

UPDATE_TAR='update.tar.gz'
if [ "$1" ]
then
    UPDATE_TAR=$1
fi

if [ ! -e $UPDATE_TAR ]
then
    echo "update file not exists: ${UPDATE_TAR}"
    exit 1
fi

if [ -f $UPDATE_TAR ]
then
    dir_name=${UPDATE_TAR%%.*}
    UPDATE_DIR=$(dirname ${UPDATE_TAR})/${dir_name}

    rm -rf UPDATE_DIR
    tar -zxf $UPDATE_TAR -C $(dirname --no-same-owner ${UPDATE_DIR})
else
    UPDATE_DIR=$UPDATE_TAR
fi

rsync -av $UPDATE_DIR/ $WEBRTC_SRC
