$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.4.12/croc_v10.4.12_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.4.12/croc_v10.4.12_Windows-64bit.zip'
  checksum       = 'f877fdfb4e08a45e425befcda23afdf639978f453012ad578f1df12c2d17d73c'
  checksum64     = '6cdbb31abc97d3156483477bab8bbb0118821e63ac8d6b177e54c84d5ec1cd7b'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
