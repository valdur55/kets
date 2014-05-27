#!/bin/bash
#example command: ./etv.sh mplayer http://etv.err.ee/arhiiv.php?id=149166
page=$(wget -q -O - "$2")



if [[ $2 == *etv2* ]]
then
    url=$(echo "$page" | awk -F",|'" '/loadFlow.*rtmp/ {print $22"/"$19}')  
else
    url=$(echo "$page" | awk -F",|'" '/loadFlow.*rtmp/ {print $5"/"$8}')
fi

$1 $url
#echo "$page" | awk -F",|'" '/loadFlow.*rtmp/ {print $0}'
