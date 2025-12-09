$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.1/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.1/tree-sitter-windows-x64.gz'
  checksum       = '65db4868a446d08bc672a4f5b0518408cfe72d00ee09b97f963a21de8d6669d0'
  checksum64     = 'cc5fa09360ed2e5a2f0d47623edd1456baa2c2e9c8160955a965ba5633e84d8d'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
