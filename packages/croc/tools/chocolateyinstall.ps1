$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.4.1/croc_v10.4.1_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.4.1/croc_v10.4.1_Windows-64bit.zip'
  checksum       = '2b293b57b1d03dde68763e1164b54352839cf0d828657b66ad3db19f0974bd0b'
  checksum64     = '3422a1372be7d1fc8817ddc95183b5fd7b31537773b8e3fcdebc773e74e0600a'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
