$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.2.5/croc_v11.2.5_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.2.5/croc_v11.2.5_Windows-64bit.zip'
  checksum       = 'c8726f0bf2d6efeead2bdbfeadf3906a0c32240a00a6bbd1dabd39b08434c658'
  checksum64     = 'ea27288832f75a90a3f2438f25a1e3ca154d0d087d6ccaa68242423a34a32fa2'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
