$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.7.0/croc_v10.7.0_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.7.0/croc_v10.7.0_Windows-64bit.zip'
  checksum       = '77fed3d3a6cd39a6f3dfec001213c10d17b032645b6544295fdb4672ca5309c5'
  checksum64     = '0eb2755ce9e73c172ec306167f3274c11b6d96de10f71a13abc7c0a2db7cd26a'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
