$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.27.2/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.27.2/tree-sitter-windows-x64.gz'
  checksum       = 'ee93b60b4c1ca72b7d5f89adfac48a67f68cca48f8ef8aa7d38b04baac13e024'
  checksum64     = '230779ee4a729e3044d4a8ed57490b776ea1bac0671d12afbd6f5b4d1878f1d0'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
