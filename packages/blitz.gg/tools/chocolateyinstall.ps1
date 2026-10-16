$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://blitz-main.blitz.gg/Blitz-3.0.10.exe'
  checksum       = '035f72909ab2ee3bcc9da07975775cdc851906fed09e2bcd90615082ecb84064'
  checksumType   = 'sha256'
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
