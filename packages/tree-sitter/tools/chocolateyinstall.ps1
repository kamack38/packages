$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.21.0-pre-release-1/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.21.0-pre-release-1/tree-sitter-windows-x64.gz'
  checksum       = '0588cc7904a90a8609e101a195a4931ddcb7186897c2301cae667129704401d0'
  checksum64     = 'b96ba923ff26225c928b0e879ea2dde24af7d7355bf286f4e5d4fcafc7acfec5'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
