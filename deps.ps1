# Check to see if we are currently running "as Administrator"
if (!(Verify-Elevated)) {
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;
   $newProcess.Verb = "runas";
   [System.Diagnostics.Process]::Start($newProcess);

   exit
}


### Update Help for Modules
Write-Host "Updating Help..." -ForegroundColor "Yellow"
Update-Help -Force


### Package Providers
Write-Host "Installing Package Providers..." -ForegroundColor "Yellow"
Get-PackageProvider NuGet -Force | Out-Null


### Install PowerShell Modules
Write-Host "Installing PowerShell Modules..." -ForegroundColor "Yellow"
Install-Module Posh-Git -Scope CurrentUser -Force
Install-Module PSWindowsUpdate -Scope CurrentUser -Force
Install-Module PSReadLine


# system and cli
winget install MSYS2.MSYS2                               --silent --accept-package-agreements
winget install Git.Git                                   --silent --accept-package-agreements --override "/VerySilent /NoRestart /o:PathOption=CmdTools /Components=""icons,assoc,assoc_sh,gitlfs"""
winget install OpenJS.NodeJS                             --silent --accept-package-agreements
winget install Anaconda.Miniconda3                       --silent --accept-package-agreements
winget install GoLang.Go                                 --silent --accept-package-agreements

# browsers
winget install Google.Chrome                             --silent --accept-package-agreements
# winget install Mozilla.Firefox                           --silent --accept-package-agreements
# winget install Opera.Opera                               --silent --accept-package-agreements

# dev tools and frameworks
winget install Microsoft.PowerShell                      --silent --accept-package-agreements
winget install JetBrains.GoLand                          --silent --accept-package-agreements --override "/Silent=True"
winget install JetBrains.PyCharm                         --silent --accept-package-agreements --override "/Silent=True"
winget install Neovim.Neovim                             --silent --accept-package-agreements
winget install Microsoft.VisualStudioCode                --silent --accept-package-agreements

# media
winget install  DuongDieuPhap.ImageGlass                 --silent --accept-package-agreements

# utilities
winget install  Microsoft.PowerToys                      --silent --accept-package-agreements
winget install  QL-Win.QuickLook                         --silent --accept-package-agreements
winget install  AgileBits.1Password                      --silent --accept-package-agreements
winget install  Fndroid.ClashForWindows                  --silent --accept-package-agreements
winget install  7zip.7zip                                --silent --accept-package-agreements
winget install  JanDeDobbeleer.OhMyPosh                  --silent --accept-package-agreements

Refresh-Environment

### Nerd Font
Write-Host "Installing Nerd Font..." -ForegroundColor "Yellow"
if (which oh-my-posh) {
    oh-my-posh font install
}

