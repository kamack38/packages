$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.13/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.13/tree-sitter-windows-x64.gz'
  checksum       = 'a3739fc98fe6e01b54421b0b39a2112519a2ed7fe26430659e3e019fe4ce1606'
  checksum64     = '99ddf495f73763419f60727e8eb79d8361aad12589e214ab82e44a80730d2e8a'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
