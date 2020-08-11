$taskpaper = get-content "./Gold Camo.taskpaper"
$readme = Get-Content "./README.md"
$readme = $readme | Select-Object -First 5

$taskpaper[0] = $taskpaper[0] -replace '(^\W+)?(.*):','## $2'
foreach ($item in $taskpaper) {
        $readme += $item -replace '(^\W+)?(.*):','### $2' -replace '(\W+)?(-\W)(.*)','- [ ] $3' -replace '(\W+)?(-\W\[\W\]\W)(.*)(\W@done)','- [x] $3'
}

$readme | Out-File "./README.md"