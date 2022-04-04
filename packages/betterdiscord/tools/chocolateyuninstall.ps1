$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = Join-Path $toolsDir "chocolateyUninstall.ahk"
$installLocation = Join-Path $toolsDir "BetterDiscord.exe"

Write-Output "Running BetterDiscord uninstaller"
Start-Process -FilePath $installLocation -PassThru
Write-Output "Running Autohotkey script"
Start-Process -FilePath 'AutoHotkey' `
    -ArgumentList $ahkFile `
    -Wait