$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = Join-Path $toolsDir "chocolateyInstall.ahk"
$installLocation = Join-Path $toolsDir "BetterDiscord.exe"

$packageArgs = @{
  packageName  = $packageName
  fileFullPath = $installLocation
  url          = 'https://github.com/BetterDiscord/Installer/releases/download/v1.2.0/BetterDiscord-Windows.exe'
  checksum     = '62101b7f23db65cdeb32e572b25631aee3e47c41949846c0f9ad3697b86cabbe'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
Write-Output "Running BetterDiscord installer"
Start-Process -FilePath $installLocation -PassThru
Write-Output "Running Autohotkey script"
Start-Process -FilePath 'AutoHotkey' `
  -ArgumentList $ahkFile `
  -Wait
