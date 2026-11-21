$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.6.6/croc_v11.6.6_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.6.6/croc_v11.6.6_Windows-64bit.zip'
  checksum       = '5e3850d3d097a908b858862ed0931022652d047e23972676496c06004af9602c'
  checksum64     = 'e84910ec971b81f34c9722dc20128d23f3b962cbdbe16437b5c289f757f88016'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
