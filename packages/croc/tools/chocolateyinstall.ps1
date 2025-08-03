$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.2.4/croc_v10.2.4_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.2.4/croc_v10.2.4_Windows-64bit.zip'
  checksum       = 'b02d5ac8793e5558bd606aaf37c040f9e629c5d84c4d1f175403f737b5b4f29c'
  checksum64     = '9e375e75ae8a74a134315ff23be63b0e39a5d022350ec3e554123c9cee291382'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
