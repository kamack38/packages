$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.8/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.8/tree-sitter-windows-x64.gz'
  checksum       = '2466bcecb5dc3213646b19bf94aee39a60ab97f156ae07454df7601100be3bcf'
  checksum64     = '28301a969412066bf4818c30c71d9c313091a9b9dc24b53a14ddda3a8e2cc2bb'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
