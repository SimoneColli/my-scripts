name="header"
destFolder="."
help=0

# Read flags
# n input file name
# d destination folder
# h help

while getopts n:f:h: flag
do
	case "${flag}" in
		n) name=${OPTARG};;
		f) destFolder=${OPTARG};;
		h) help=1;;
	esac
done

# help
if [ "$help" != "0" ]; then
	echo ""
	echo "Help"
	echo ""
	echo ""
	echo "-n name, to choose the header name (default header)"
	echo ""
	echo "-f name, to choose the destination folder, create if not exist"
	echo ""
	echo "-h help"
	echo ""
	exit
fi

# check dest folder default/create
if [ "$destFolder" != "." ]; then
	# if dest folder not exists
	if [ ! -d "$destFolder" ]; then
		mkdir "$destFolder"
		echo "folder created"
	fi
fi

out="${destFolder}/${name}.hh"

#check file name
if [ "${destFolder}/${name}" != "header" ]; then
	if [ -f "$out" ]; then
		echo "file already exist"
		exit 1;
	fi
fi

upperName=$(echo $name | tr '[:lower:]' '[:upper:]')

# echo "$upperName"
# echo "${destFolder}/${name}"

echo "#ifndef ${upperName}_GUARD_HH" >> "$out"
echo "#define ${upperName}_GUARD_HH 1" >> "$out"

echo "" >> "$out"
echo "" >> "$out"

echo "#endif // end $name" >> "$out"