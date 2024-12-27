$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.24.6/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.24.6/tree-sitter-windows-x64.gz'
  checksum       = 'f5b43559d4d851ce8f1d3bfa0ff79f06da9ecd9540eef92186c322e8d83a0f52'
  checksum64     = '25e003d2a7cc28666ff02e3449fd7d0a883acd4eb97492d9b1e831f4f6f7e8b0'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
