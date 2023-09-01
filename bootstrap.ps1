$profileDir = Split-Path -parent $profile
$componentDir = Join-Path $profileDir "components"
$terminalConfigDir = Join-Path $home "AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue
New-Item $componentDir -ItemType Directory -Force -ErrorAction SilentlyContinue

Copy-Item -Path ./*.ps1 -Destination $profileDir -Exclude "bootstrap.ps1"
Copy-Item -Path ./components/** -Destination $componentDir -Include **
Copy-Item -Path ./home/** -Destination $home -Include **
Copy-Item -Path ./windows-terminal/** -Destination $terminalConfigDir -Include **

Remove-Variable componentDir
Remove-Variable profileDir
Remove-Variable terminalConfigDir
