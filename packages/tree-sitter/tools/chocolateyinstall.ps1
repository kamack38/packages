$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.24.1/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.24.1/tree-sitter-windows-x64.gz'
  checksum       = 'dec28e3cd63a59455e4c8d22b40b75ff8a89ca53fbe796580e5a027caeff36b2'
  checksum64     = 'c3f3aa8c4a140b6fa1e2ddf84eaddd740fd8cf6508ed0b883b681ee5ba65a8dc'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
