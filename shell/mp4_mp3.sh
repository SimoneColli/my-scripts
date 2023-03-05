#!/bin/bash

# Default values

destFolder="."
inputName="*"
name=""

# Read flags
# i input file name
# d destination folder
# n new file name

while getopts i:d:n: flag
do
	case "${flag}" in
		i) inputName=${OPTARG};;
		d) destFolder=${OPTARG};;
		n) name=${OPTARG};;
	esac
done

# Create destination folder
if [ "$destFolder" != "." ]; then
	mkdir "$destFolder"
fi

# Remove .mp4 extension from file name

extension=".mp4"
inputName=${inputName/$extension}

if [ "$inputName" == "*" ]; then

	# If no file name is specified all file .mp4 will be converted

	for i in *.mp4
	do
		fileName=${i/$extension}
		
		echo "$fileName"

		ffmpeg -i "$i" -vn \
			-acodec libmp3lame -ac 2 -ab 160k -ar 48000 \
			"$fileName".mp3

		echo "$fileName converted"

		if [ "$destFolder" != "." ]; then
			mv "$fileName".mp3 "$destFolder"
			echo "$fileName moved to $destFolder"
		fi
	done
	echo "Files converted"

else
	#Convert specified file

	for i in "${inputName}".mp4
	do	
		fileName=${i/$extension}
		
		if [ "$name" != "" ]; then
			fileName=$name
		fi
		echo "$fileName"

		ffmpeg -i "$i" -vn \
			-acodec libmp3lame -ac 2 -ab 160k -ar 48000 \
			"$fileName".mp3

		echo "$fileName converted"

		if [ "$destFolder" != "." ]; then
			mv "$fileName".mp3 "$destFolder"
			echo "$fileName moved to $destFolder"
		fi

	done
	echo "File converted"
fi
