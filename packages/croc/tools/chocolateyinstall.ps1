$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v9.6.0/croc_9.6.0_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v9.6.0/croc_9.6.0_Windows-64bit.zip'
  checksum       = '0c7c16e2456c4a3f25e1146f129c5588c781d1a7ed5e5a65476409369eb58628'
  checksum64     = '9b96a8891da7419abaf4a0d7dddc641da62c315147263f6c4a3e24d85a2eb7c1'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
