#!/bin/bash


#example: ./k2.sh mplayer http://kanal2.ee/pluss/video/?id=20756

id=$(echo $2 | awk -F"/" '{print$NF}')
pp="http://kanal2.ee/video/playerPlaylistApi/"
page=$(wget -q -O - "$pp""$id")

#getline for lq.  getline;getline for hq
url=$(echo "$page" | awk -F"\"" '/rtmp/ {printf $2"/"; getline; getline ; print$2}')

$1 "$url"
