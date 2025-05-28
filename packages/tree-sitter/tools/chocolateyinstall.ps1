$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.25.5/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.25.5/tree-sitter-windows-x64.gz'
  checksum       = '05a018630bedc1a19cabcdd690bd656f1c68832f0d7201f9267ca6fbd28550e8'
  checksum64     = 'bb73533e604c7aeb0a63e9af177d9d18c61ab42a8b2baeec44bb2cd59ab5fbf6'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
