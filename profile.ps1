# Profile for the Microsoft.Powershell Shell, only. (Not Visual Studio or other PoSh instances)
# ===========

Push-Location (Split-Path -parent $profile)
"components","functions","aliases","exports","extra" | Where-Object {Test-Path "$_.ps1"} | ForEach-Object -process {Invoke-Expression ". .\$_.ps1"}
Pop-Location

Import-Module PSReadLine

if ($host.Name -eq 'ConsoleHost') {
    Import-Module PSReadline
     
    Set-PSReadLineOption -EditMode Emacs

    Set-PSReadLineKeyHandler -Key Tab -Function Complete

    Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadlineKeyHandler –Key DownArrow -Function HistorySearchForward
    }

Invoke-Expression (&starship init powershell)