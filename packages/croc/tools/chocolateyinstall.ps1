$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.0.3/croc_v11.0.3_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.0.3/croc_v11.0.3_Windows-64bit.zip'
  checksum       = 'cc3507176f9953ccab3a12fee59e5b3eb9eb86f307f4f7da26842b82d6ddeddd'
  checksum64     = '07c82cf1388abf493a97fcfa74b0bb98adb217700c596f6742520d2b970cb5cb'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
