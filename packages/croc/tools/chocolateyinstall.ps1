$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.4.6/croc_v10.4.6_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.4.6/croc_v10.4.6_Windows-64bit.zip'
  checksum       = 'b70aa5dd09c772bb5caf7609379a6865b6af21b039f2608c1425c65436ab1414'
  checksum64     = 'c946994ca6e689704832f14e11e30d4cc54d85db255b62e207a71828e0246103'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
