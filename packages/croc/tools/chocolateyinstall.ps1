$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.0.11/croc_v10.0.11_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.0.11/croc_v10.0.11_Windows-64bit.zip'
  checksum       = '4fbefee490094e64f4240fecc98e5da27d1d4e9b3e11ddddde827739dd6b2810'
  checksum64     = '34fe7f77be3e198c9ebbc12d1193d43f6f37fcb2a7e18d3379aef1f4a2b7576a'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
