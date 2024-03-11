$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.22.1/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.22.1/tree-sitter-windows-x64.gz'
  checksum       = '4e06b4e04c52d8a22c84cb4529f7bc133f01e6cf60bbc6f1cf7fa1c1d5be4ec5'
  checksum64     = '6d62f1ea39451abf468fdb77776cc421a7fd9c186dc3a4382f1b1b1ae347848a'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
