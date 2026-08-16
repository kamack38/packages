$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.1.1/croc_v11.1.1_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.1.1/croc_v11.1.1_Windows-64bit.zip'
  checksum       = '24c989927c8c33e199dc0e57a438234b82f5b1cf568e70e18ec6a1603982706c'
  checksum64     = '08c9d79d679f7ed560805ba542b62b65802e11f074b24bc02a6827a0c2d5602c'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
