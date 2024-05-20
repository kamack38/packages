$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v9.6.16/croc_v9.6.16_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v9.6.16/croc_v9.6.16_Windows-64bit.zip'
  checksum       = '6bef69ba06069be0bb98759c7331b9644c433c0add32a2b39d567c59aa554125'
  checksum64     = '0f22a35ff29e2076f1940a92eb69a26b3c6f75227d95fbf3351a84c43b96d26d'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
