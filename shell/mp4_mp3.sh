#!/bin/bash
#flags:
#-i input file name
#-h help
#-d destination folder


while getopts i:d:h: flag
do
	case "${flag}" in
		i) inputName=${OPTARG};;
		d) destFolder=${OPTARG};;
		h) ;;
	esac
done

extension=".mp4"
mkdir "$destFolder"

for i in "${inputName}".mp4
do
	file=${i/$extension}

	ffmpeg -i "$i" -vn \
		-acodec libmp3lame -ac 2 -ab 160k -ar 48000 \
        "$file".mp3
	echo "$file converted"
	mv "$file".mp3 "$destFolder"
	echo "$file moved"
done

#mv *.mp3 ./converted
