$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.6.7/croc_v11.6.7_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.6.7/croc_v11.6.7_Windows-64bit.zip'
  checksum       = '9a7b59b2d150fcd5c53f0818e73e7d3c48bba6396ea555f5e89ea2513e1e5043'
  checksum64     = '44de6a9d107e0021238222f3cbf83696e83d627e951fb0bfe3ad615786e539e0'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
