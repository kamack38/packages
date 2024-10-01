$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.0.13/croc_v10.0.13_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.0.13/croc_v10.0.13_Windows-64bit.zip'
  checksum       = 'f71827d765947a4d4b19258a7351742a4bdc4d54f64d15141cd32bcb2e464b38'
  checksum64     = '620f9ced645d3d28ce2f3c2442b1387ae4953f69fd9cb3304340da8f04be0ee5'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
