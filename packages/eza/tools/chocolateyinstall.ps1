$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/eza-community/eza/releases/download/v0.23.3/eza.exe_x86_64-pc-windows-gnu.zip'
  checksum       = '032963c3d47134d7976f8e17b0201efcff09fdcc7742d8a0db2135b38c8ce1f8'
  checksumType   = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
