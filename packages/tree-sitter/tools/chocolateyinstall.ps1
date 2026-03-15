$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.7/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.7/tree-sitter-windows-x64.gz'
  checksum       = '2b14a5d2590ee60b86d16768e2218026e9361dc328f15eaea1be0fd60395c310'
  checksum64     = '5cea52c5e8000fbe56c41148dd3124fded2fe7cd0f66e4194bf92532905c55ff'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
