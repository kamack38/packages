$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.2.1/croc_v10.2.1_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.2.1/croc_v10.2.1_Windows-64bit.zip'
  checksum       = '70a4631e43134af49d957c6e4fa3275383c1543f5462d6230f90b2e446189efe'
  checksum64     = '19cf7f92ad4a5f458e6569830e2ff805e3fa50723e67fff5ef430fac4a40b62e'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
