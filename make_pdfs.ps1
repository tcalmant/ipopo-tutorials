$sourceFolders = Get-ChildItem -Path slides,exercises -Directory -Recurse

ForEach($folder in $sourceFolders) {
	# Compute the full path of the main .tex file
	$fileName = "$($folder.Name).tex"
	$filePath = Join-Path $($folder).FullName $fileName
	if (-not (Test-Path $filePath)) {
		continue
	}
	
	# Found it
	echo "Compiling: $fileName..."
	
	# Move in the folder
	Push-Location -Path $folder.fullName
	
	# Compile twice
	pdflatex -shell-escape=1 $fileName
	pdflatex -shell-escape=1 $fileName
	
	# Go back
	Pop-Location
}

echo "Done."
