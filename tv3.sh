#!/bin/bash


#example: ./tv3.sh mplayer http://viastream.viasat.tv/PlayProduct/302716

id=$(echo $2 | awk -F"/" '{print$NF}')
pp=http://viastream.viasat.tv/PlayProduct/


$1 $(wget -q -O - "$pp""$id" |awk -F"\[|\]|:" '/rtmp/ {print $3 ":" $4 ":" $5 "/" $6}')


