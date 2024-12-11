$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.24.5/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.24.5/tree-sitter-windows-x64.gz'
  checksum       = '6de0f0607c7bec88328f98cfb093f8118d0b3809501b7fdf3699edf1500bb42e'
  checksum64     = '1374e92f2f2ea7fa233138e5e596566747a5cca4e59bbbe7f6ceb0bf0fc1f584'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
