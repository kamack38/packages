$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v9.5.3/croc_9.5.3_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v9.5.3/croc_9.5.3_Windows-64bit.zip'
  checksum       = 'ea4c733f7fc4107595e6ce5c257514960d2e1ee672372dc8169d3cb1c742c6c0'
  checksum64     = '3fb5f731b6489fd3bd5f6f63b286f5080ca929027f284113f65f446ac8024fed'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
