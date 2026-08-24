$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.3.0/croc_v11.3.0_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.3.0/croc_v11.3.0_Windows-64bit.zip'
  checksum       = 'e649f3c0d05b8b121879f9442908fa94cd5f6674c8a576ad6bd5a0852d5888c5'
  checksum64     = '7ec9361b1d34e42ee2e278e64ca61d27f910a2cbce9b05db8d14b41d2caaad7d'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
