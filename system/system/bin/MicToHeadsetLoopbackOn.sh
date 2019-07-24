#!/system/bin/sh
index=`getprop sys.cm.mic_test`
microphone=""
echo $index
if [ $index -eq 1 ]
then
    microphone="DMIC1"
elif [ $index -eq 2  ]
then
    microphone="DMIC3"
elif [ $index -eq 3 ]
then
    microphone="DMIC4"
elif [ $index -eq 4 ]
then
    microphone="DMIC2"
fi

log -t recordertesting "$microphone"

tinymix 'ADC MUX7' 'DMIC'
tinymix 'DMIC MUX7' $microphone
tinymix 'IIR0 INP0 MUX' 'DEC7'
tinymix 'RX INT1_1 MIX1 INP1' 'IIR0'
tinymix 'RX INT2_1 MIX1 INP1' 'IIR0'
tinymix 'RX INT1 DEM MUX' 'CLSH_DSM_OUT'
tinymix 'RX INT2 DEM MUX' 'CLSH_DSM_OUT'
tinymix 'IIR0 INP0 Volume' 84
