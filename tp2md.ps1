$taskpaper = get-content "./Gold Camo.taskpaper"
$taskpaper = $taskpaper | Select-Object -Skip 1
$readme = Get-Content "./README.md"
$readme = $readme | Select-Object -First 4
foreach ($item in $taskpaper) {
        $readme += $item -replace '(^\W+)?(.*):','$1## $2' -replace '(\W+)?(-\W)(.*)','$1- [ ] $3' -replace '(\W+)?(-\W\[\W\]\W)(.*)(\W@done)','$1- [x] $3'
}

$readme | Out-File "./README.md"