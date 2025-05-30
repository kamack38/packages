$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  fileType64     = 'exe'
  url            = 'https://github.com/eza-community/eza/releases/download/v0.21.4/eza.exe_x86_64-pc-windows-gnu.zip'
  url64bit       = 'https://github.com/eza-community/eza/releases/download/v0.21.4/eza.exe_x86_64-pc-windows-gnu.zip'
  checksum       = '0d262a4565f99a32c19a77a731407955e46b524cf51a1662b1854635a02553db'
  checksum64     = '0d262a4565f99a32c19a77a731407955e46b524cf51a1662b1854635a02553db'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
