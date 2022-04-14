$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$location = Join-Path $toolsDir 'BorderlessMinecraft.exe'

$packageArgs = @{
  packageName  = $packageName
  url          = 'https://github.com/Mr-Technician/BorderlessMinecraft/releases/download/v1.3.2/BorderlessMinecraft.exe'
  checksum     = '6f8a72539ceebeb5d57c14b96c7b868ee8d1b6a8fc0e7ad2443883b3bafed28d'
  checksumType = 'sha256'
  fileFullPath = $location
}

$shortcutArgs = @{
  shortcutFilePath = Join-Path $env:APPDATA "Microsoft\Windows\Start Menu\Programs\BorderlessMinecraft.lnk"
  targetPath       = $location
}

Get-ChocolateyWebFile @packageArgs

Install-ChocolateyShortcut @shortcutArgs