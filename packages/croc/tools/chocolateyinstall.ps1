$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.6.0/croc_v11.6.0_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.6.0/croc_v11.6.0_Windows-64bit.zip'
  checksum       = '156d34f76031630895d29972f137d57fed6d1672979f7a183bad404c0e0045bc'
  checksum64     = '08e9547c893f04d7ae375d6a14265764afc2c2703b6ff7146e8e75d6be1f2df3'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
