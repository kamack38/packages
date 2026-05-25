$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType64     = 'exe'
  url64bit       = 'https://github.com/8LWXpg/dwag/releases/download/v1.0.1/dwag-x86_64-pc-windows-msvc.zip'
  checksum64     = '9424caee35a127d8090fc14570ce72c3d26f18c503b024137aa5fde2484ad35e'
  checksumType64 = 'sha256'
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
