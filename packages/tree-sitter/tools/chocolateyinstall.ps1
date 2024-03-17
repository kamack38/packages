$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.22.2/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.22.2/tree-sitter-windows-x64.gz'
  checksum       = 'b4f8fb6d2ad2f2c727a788cf9f4c0d2a3681289c91dad9bb1e3f16a7d50895c3'
  checksum64     = '3520ed1d3d0c1433187b7d2a966e1f5a389427f477880e85fc7f6e4b1cb0ce3c'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
