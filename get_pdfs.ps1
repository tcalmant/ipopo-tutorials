echo "Copying slides..."
ls -Path slides -Filter *.pdf -Recurse | Where-Object { "imgs".CompareTo($_.Directory.Name) } | Copy-Item -Path { $_.FullName } -Destination $PWD

echo "Copying exercises..."
ls -Path exercises -Filter *.pdf -Recurse | Where-Object { "imgs".CompareTo($_.Directory.Name) } | Copy-Item -Path { $_.FullName } -Destination $PWD
echo "Done"
