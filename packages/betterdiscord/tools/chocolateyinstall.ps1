$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = Join-Path $toolsDir "chocolateyInstall.ahk"
$installLocation = Join-Path $toolsDir "BetterDiscord.exe"

$packageArgs = @{
  packageName  = $packageName
  fileFullPath = $installLocation
  url          = 'https://github.com/BetterDiscord/Installer/releases/download/v1.3.0/BetterDiscord-Windows.exe'
  checksum     = ''
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
Write-Output "Running BetterDiscord installer"
Start-Process -FilePath $installLocation -PassThru
Write-Output "Running Autohotkey script"
Start-Process -FilePath 'AutoHotkey' `
  -ArgumentList $ahkFile `
  -Wait
