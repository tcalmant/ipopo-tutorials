echo "Copying..."
ls -Path slides,exercises -Filter *.pdf -Recurse | Where-Object { "imgs".CompareTo($_.Directory.Name) } | Copy-Item -Path { $_.FullName } -Destination $PWD
echo "Done."
