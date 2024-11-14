$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.1.0/croc_v10.1.0_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.1.0/croc_v10.1.0_Windows-64bit.zip'
  checksum       = 'e1d7927c9f4b7bc9e5079ca22857b46ea5e39fd4d1fbe415ac24c12ec7b912f9'
  checksum64     = '5e396778b4dddc94afa030aa8cb23e4c2de4b9f2a9bc3a8ee5d43c0567c8c4eb'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
