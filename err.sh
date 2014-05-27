#!/bin/bash
#example command: ./err.sh mplayer http://etv.err.ee/arhiiv.php?id=149166
page=$(wget -q -O - "$2")


case $2 in
    *etv2.err.ee* )
        url=$(echo "$page" | awk -F",|'" '/loadFlow.*rtmp/ {print $22""$19}') ;;
    *arhiiv.err.ee* )
        url=$(echo "$page" | awk -F",|'" '/streamer/ {printf $2"/" ; getline ; print$2;}') ;;
    *etv.err.ee* ) 
        url=$(echo "$page" | awk -F",|'" '/loadFlow.*rtmp/ {print $5"/"$8}') ;;
    *m3.err.ee* )
        url=$(echo "$page" | awk -F"\[|\]|\"" '/rtmp/ {print $4$6}') ;;
    #Works on err portal (videos/audio with preview pricture) 
    *.err.ee* )
        url=$(echo "$page" | awk -F"=|&" '/stream/ {print "rtmp://"$9$11}') ;;
    * )
        echo "Tundmatu link" ;;
esac

$1 $url
#echo "$page" | awk -F",|'" '/loadFlow.*rtmp/ {print $0}'
