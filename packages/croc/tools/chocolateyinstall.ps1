$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.4.7/croc_v10.4.7_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.4.7/croc_v10.4.7_Windows-64bit.zip'
  checksum       = 'f7f06194773df5e028b2cc36132a31a9bef856b01fafe89b9df18ebf17c2bebb'
  checksum64     = '38d9b3d35c1331cb355792b17887cae4aafafe13a641fdb4ed492c3907f446aa'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
