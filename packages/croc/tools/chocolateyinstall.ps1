$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.6.2/croc_v11.6.2_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.6.2/croc_v11.6.2_Windows-64bit.zip'
  checksum       = 'f8293ceb509f7d52595f519471539ee8d19fb92def0ecc84845b528caab4f2a0'
  checksum64     = 'c5f654b750e76272d6deb6d4352c29e81cc86fef1c9f46b5f3f60de78d2dd355'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
