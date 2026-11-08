$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.6.5/croc_v11.6.5_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.6.5/croc_v11.6.5_Windows-64bit.zip'
  checksum       = 'f4772cb30387d91d1959a5e6f4c95025423d1ee7ab0af6364d5c8df99c980c34'
  checksum64     = 'ae5b9d249099ff159f6a4b91824a2bf7d2b32f0dd77342aef51b34154aa4fffb'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
