#!/bin/bash

for subdir in $(find slides exercises -type d)
do
    basedirname=$(basename "$subdir")
	filename="${basedirname}.tex"
	filepath="$subdir/$filename"
	
	if [ ! -e "$filepath" ]
	then
		# Not a source folder
		continue
	fi
	
	# Found it
	echo "Compiling: $filename..."

	# Found it: move in the folder
	pushd "$subdir" >/dev/null
	
	# Compile twice
	pdflatex -shell-escape=1 $filename >/dev/null && pdflatex -shell-escape=1 $filename >/dev/null
	
	# Go back
	popd >/dev/null
done

echo "Done."
