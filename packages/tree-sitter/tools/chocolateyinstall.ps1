$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.0/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.0/tree-sitter-windows-x64.gz'
  checksum       = '44c24ba4c3846f8af82f09767b88b4849a71b015623075579d7534d6d7a85af3'
  checksum64     = '4a822a6fe404956f1f9cbe4254eba9081fd4b332800029cbf92b8f6fd3723232'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
