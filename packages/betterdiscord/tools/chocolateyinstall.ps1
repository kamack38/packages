$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = Join-Path $toolsDir "chocolateyInstall.ahk"
$installLocation = Join-Path $toolsDir "BetterDiscord.exe"

$packageArgs = @{
  packageName  = $packageName
  fileFullPath = $installLocation
  url          = 'https://github.com/BetterDiscord/Installer/releases/download/v1.1.1/BetterDiscord-Windows.exe'
  checksum     = '50ed26767c4866ebd94f76d23cb1c535df16d3f87840fb3dba3fd77409f00d0b'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
Write-Output "Running BetterDiscord installer"
Start-Process -FilePath $installLocation -PassThru
Write-Output "Running Autohotkey script"
Start-Process -FilePath 'AutoHotkey' `
  -ArgumentList $ahkFile `
  -Wait