$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.4.14/croc_v10.4.14_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.4.14/croc_v10.4.14_Windows-64bit.zip'
  checksum       = '39d6b779900da1f3e2bb778ab1c246db9fd9bd103fc008a8a03111d40544a780'
  checksum64     = 'a8e2ec2437f24b62c1038a5363b7d808c8589c1ed0da63e7f929ed09dedb3d43'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
