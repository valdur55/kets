#!/bin/bash
#example command: ./etv.sh mplayer http://etv.err.ee/arhiiv.php?id=149166
$1 $(wget -q -O - "$2" | awk -F",|'| " '/loadFlow.*rtmp/ {print $6"/"$9}')
