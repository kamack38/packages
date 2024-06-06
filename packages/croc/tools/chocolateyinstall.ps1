$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.0.8/croc_v10.0.8_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.0.8/croc_v10.0.8_Windows-64bit.zip'
  checksum       = ''
  checksum64     = ''
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
