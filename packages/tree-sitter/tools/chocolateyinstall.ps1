$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.6/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.6/tree-sitter-windows-x64.gz'
  checksum       = 'fb510026ad459dd140d782b8b66e0644f5bca9f7e4402ef48850894b9c702622'
  checksum64     = '6c34a5babc156dcb9cbd13678c58486dfb6f1998ccdb3bba819b0d2986c49e80'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
