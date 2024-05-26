$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.0.5/croc_v10.0.5_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.0.5/croc_v10.0.5_Windows-64bit.zip'
  checksum       = 'c34baf9592fc2201d002dadfc7c0bfedca6ddef08532f458c57d7c9026011f1a'
  checksum64     = 'f3a5efebc03c5dfa24ad22442904d45f7cc4e25ab925fdaf9ed774360142245f'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
