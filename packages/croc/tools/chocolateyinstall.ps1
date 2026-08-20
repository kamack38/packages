$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.2.4/croc_v11.2.4_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.2.4/croc_v11.2.4_Windows-64bit.zip'
  checksum       = '4987c64a0fedb67e54db2181acbc9b68e433d5a01f9b007a8efdf2204e58a244'
  checksum64     = '77f9a16d63c18e8c28166696126ef65f4a418d8167e4b5499739a8e2c0535cf8'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
