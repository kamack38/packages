$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.2.7/croc_v10.2.7_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.2.7/croc_v10.2.7_Windows-64bit.zip'
  checksum       = 'a9c767785f16551aac6d1b92b042157890523f4500949867f0ad6748e9bc30a6'
  checksum64     = 'ce6c73c280bf92b44f92c38417b0d0f7ffe62cd62b43cecba3d009a1befb3465'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
