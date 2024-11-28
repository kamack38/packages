$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.1.1/croc_v10.1.1_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.1.1/croc_v10.1.1_Windows-64bit.zip'
  checksum       = 'ac28dbde92097b0e44afe3b47438c963845d65fa88aed27136ebca38870adda5'
  checksum64     = 'a3441775e9833939a238c5b13fe8564b225ef0def7983fc9ef1746e48f3f82ed'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
