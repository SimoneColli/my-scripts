#!/bin/bash
#Shell file converter

echo "File converter"

echo "Insert starting files extension: "
read firstExt
echo "Insert end files extension:"
read secondExt

if [$firstExt ="mpeg" && $secondExt="mp3"] then
	for file in *.mpeg do
		echo "$file"
		#filename=$(basename "$file" .mpeg)
		#ffmpeg -i $file -vn -ar 44100 -ac 2 -b:a 192k $filename .mp3
	done
