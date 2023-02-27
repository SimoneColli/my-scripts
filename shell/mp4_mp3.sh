#!/bin/bash

extension=".mp4"

for i in *.mp4
do
	file=${i/$extension}

	ffmpeg -i "$i" -vn \
       -acodec libmp3lame -ac 2 -ab 160k -ar 48000 \
        "$file".mp3

	echo "$file converted"
done

#mv *.mp3 ./converted
