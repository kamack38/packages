$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.24.3/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.24.3/tree-sitter-windows-x64.gz'
  checksum       = '9dbd203fae22e027783a2b71f10f11bbddf882e1bfe85033fe5b3ee2f070d26c'
  checksum64     = 'f58a7d59a5499eeaf76288c633ebbc56b5cd2839cfed9c8c2d55005a47709d3b'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
