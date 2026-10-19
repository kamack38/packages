$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType64     = 'exe'
  url64bit       = 'https://github.com/8LWXpg/dwag/releases/download/v1.0.2/dwag-x86_64-pc-windows-msvc.zip'
  checksum64     = '34118f685e5a727c75250986eda84497f8722e8c3b4ad14ecfc57972fde12d3e'
  checksumType64 = 'sha256'
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
