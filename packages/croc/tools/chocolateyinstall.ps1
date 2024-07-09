$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.0.10/croc_v10.0.10_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.0.10/croc_v10.0.10_Windows-64bit.zip'
  checksum       = '5ebaf4c03c0431e523fe8f920a9d442ad59e2154fc76553ebe17c498300d8ba7'
  checksum64     = '724c9d8f3e2a04d5ff2829091988e14ab528f457416b7630f72d21dd28234acd'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
