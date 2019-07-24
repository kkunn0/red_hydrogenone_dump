#!/system/bin/sh

value=`getprop sys.shutdown.requested`
value1=`getprop vold.mute.state`
value2=`getprop sys.mute.state`

echo $value $value1 $value2

if [ "$value" != "" ]; then
    echo "shutdown animation exit!"
    exit 1
fi

if [ "$value2" == "" ]; then
    if [ "$value1" == "1" ]; then
        echo "vold.mute.state exit!"
        exit 1
    fi
elif [ "$value2" == "1" ]; then
    echo "sys.mute.state exit!"
    exit 1
fi

tinymix "PRI_MI2S_RX Audio Mixer MultiMedia1" 1
tinyplay /system/media/bootsound.wav
tinymix "PRI_MI2S_RX Audio Mixer MultiMedia1" 0

