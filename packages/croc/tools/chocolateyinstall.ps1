$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.0.9/croc_v10.0.9_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.0.9/croc_v10.0.9_Windows-64bit.zip'
  checksum       = 'eba4051d72bfc26f67503d7fdce1ee5bc6b0ac76949826f4afab6664209957f2'
  checksum64     = 'e93ff9171c686f23b1007ecf288ce26d31c446feafbbf11f81305a03944a70c8'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
