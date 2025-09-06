$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/eza-community/eza/releases/download/v0.23.2/eza.exe_x86_64-pc-windows-gnu.zip'
  checksum       = 'fa265f6857d7c91a9f412fd8eb2dc13b9036170e4e3d5746220957cdbcac22a4'
  checksumType   = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
