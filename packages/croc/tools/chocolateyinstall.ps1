$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.4.4/croc_v10.4.4_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.4.4/croc_v10.4.4_Windows-64bit.zip'
  checksum       = '6e6bfa7c0ad73817b1b938e20228194179d890a6517e49e07f8443b021a56f0a'
  checksum64     = '30073b3bcb4c28f0122fbf2d00eccac9ece7c28c65c9111616fc6ff96666437f'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
