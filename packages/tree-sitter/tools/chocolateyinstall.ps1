$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.6/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.6/tree-sitter-windows-x64.gz'
  checksum       = '9c6d1610a8728c1405cb9606447ec2a8a4ffc892d2c8d362f5488e4d3f276211'
  checksum64     = '76d52345b1ef0d1f1b3f4357b42f39bc521c0bf7e87c9e18664bbb71da1577b8'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
