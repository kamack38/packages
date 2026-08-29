$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.3.4/croc_v11.3.4_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.3.4/croc_v11.3.4_Windows-64bit.zip'
  checksum       = 'acd8b47cd60875e918d51b8d6bc61d148728cc38d0a3140e60cdc399fdf678a0'
  checksum64     = '8981c9db5e67ae7fbc23746263828936010ba6568984f56768776ae45565ce98'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
