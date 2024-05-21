$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v9.6.17/croc_v9.6.17_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v9.6.17/croc_v9.6.17_Windows-64bit.zip'
  checksum       = 'c6d30b7cba91fdf98c720d592a5d1b06a195786e31a32ee0aa7c161d5311c48a'
  checksum64     = 'bdb34092a49fefb35cadcd34a6ab035458e4b9eaf3ad6c2cd576a34b6a380f05'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
