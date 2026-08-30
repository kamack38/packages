$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.27.0/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.27.0/tree-sitter-windows-x64.gz'
  checksum       = 'daf34b1c63080dd76453b4911d62052dd90bce4faeccebe0a4ecf855d3ca7b7a'
  checksum64     = '2d6c014b4e91d3d302ba7b30b3b625914027c3861ae7817e068a273e3f034550'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
