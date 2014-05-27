#!/bin/bash
#example command: ./err.sr mplayer http://etv.err.ee/arhiiv.php?id=149166
page=$(wget -q -O - "$2")

url="oo"
case $2 in
    *etv2.err.ee* )
        url=$(echo "$page" | awk -F",|'" '/loadFlow.*rtmp/ {print $22""$19}') ;;
    *arhiiv.err.ee* )
        url=$(echo "$page" | awk -F",|'" '/streamer/ {printf $2"/" ; getline ; print$2;}') ;;
    *etv.err.ee* ) 
        url=$(echo "$page" | awk -F",|'" '/loadFlow.*rtmp/ {print $5"/"$8}') ;;
    * )
        echo "Tundmatu link" ;;
esac

$1 $url
#echo "$page" | awk -F",|'" '/loadFlow.*rtmp/ {print $0}'
