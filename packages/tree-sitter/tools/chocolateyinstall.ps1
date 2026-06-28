$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.10/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.10/tree-sitter-windows-x64.gz'
  checksum       = '5b85521ae808d9476d9f273a775d7fb3b3d2d1c802b9d002c07c84aa4e998ca5'
  checksum64     = '6f59606dafabd8ac49c84c36ae4f0178e6aadd9232e5602c6fb0406d1b79129a'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
