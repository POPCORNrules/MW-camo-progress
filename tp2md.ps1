$taskpaper = get-content "./Gold Camo.taskpaper"
$taskpaper = $taskpaper | Select-Object -Skip 1
$readme = Get-Content "./README.md"
$readme = $readme | Select-Object -First 5
foreach ($item in $taskpaper) {
        $readme += $item -replace '(^\W+)?(.*):','### $2' -replace '(\W+)?(-\W)(.*)','- [ ] $3' -replace '(\W+)?(-\W\[\W\]\W)(.*)(\W@done)','- [x] $3'
}

$readme | Out-File "./README.md"