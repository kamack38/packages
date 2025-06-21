$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/eza-community/eza/releases/download/v0.21.5/eza.exe_x86_64-pc-windows-gnu.zip'
  checksum       = '9b4e7ad1340991e165fb5d92b5e9c479ad6b9f9766d56237f5d1e8a3d0e9eb58'
  checksumType   = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
